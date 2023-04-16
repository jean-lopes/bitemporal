\set QUIET 'on'

create extension btree_gist;

create table s
  ( id                 text not null
  , value              int not null
  , valid_period       int4range not null
  , transaction_period int4range not null default int4range(0, null)
  , primary key(id, valid_period)
  , exclude using gist (id with =, valid_period with &&)
  , exclude using gist (id with =, value with =, valid_period with -|-)
  );

create table s_history (like s);

create table relationships(name text not null primary key);

insert into relationships(name)
values ('overlapped')
     , ('connected')
     , ('separated');

create function last_tx_time()
returns int as
$BODY$
  select coalesce(max(x.val), 0)
    from (select lower(transaction_period) as val from s
           union
          select upper(transaction_period) from s
           union
          select lower(transaction_period) from s_history
           union
          select upper(transaction_period) from s_history) x;
$BODY$ language sql;

create procedure save_s
    ( s_id           s.id%type
    , s_value        s.value%type
    , s_valid_period s.valid_period%type
    ) as $$
declare
    r s;
    vps int4multirange;
    vp s.valid_period%type;
begin
    if isempty(s_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %)', s_id, s_valid_period;
    for r in
       select id
            , value
            , valid_period
            , transaction_period
         from s
        where id = s_id
          and valid_period && s_valid_period
    loop
        raise debug 'found overlapping record: (%, %, %)', r.id, r.value, r.valid_period;

        vps := r.valid_period::int4multirange - s_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %)', r.id, r.valid_period;
        delete from s where id = r.id and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                if not isempty(vp) then
                    raise debug 'inserting unmatched part of overlapped record with period: (%, %, %)', r.id, r.value, vp;
                    insert into s(id, value, valid_period) values(r.id, r.value, vp);
                end if;
            end loop;
        end if;
    end loop;

    raise debug 'checking for adjacency: (%, %, %)', s_id, s_value, s_valid_period;

    select range_agg(x.valid_period)
      into vps
      from (select s_valid_period as "valid_period"
             union all
            select valid_period
              from s
             where id = s_id
               and value = s_value
               and valid_period -|- s_valid_period) x     ;

    raise debug 'vps: %', vps;

    if not isempty(vps) then
      foreach vp in array (select array_agg(x.*) from unnest(vps) x)
      loop
        raise debug 'vp: %', vp;

        raise debug 'deleting adjacents: (%, %, %)', s_id, s_value, s_valid_period;
        delete from s where id = s_id and value = s_value and valid_period -|- s_valid_period;

        raise debug 'inserting consolidated record: (%, %, %)', s_id, s_value, vp;
        insert into s(id, value, valid_period) values (s_id, s_value, vp);
        return;
      end loop;
    end if;

    raise debug 'inserting desired record: (%, %, %)', s_id, s_value, s_valid_period;
    insert into s(id, value, valid_period) values(s_id, s_value, s_valid_period);
end; $$ language plpgsql;

create table unpacked (like s);
create table packed (like s);

alter table unpacked
    add constraint uk_unpacked
    unique (id, valid_period);

create procedure unpack(filter text) as $body$
declare
  r s;
  l int;
  u int;
  n int;
begin
  execute format('delete from unpacked as "s" where %s', filter);

  for r in execute format($$select id
                                 , value
                                 , valid_period
                                 , transaction_period
                              from s as "s"
                             where %s
                             order by valid_period$$, filter)
  loop
    l := lower(r.valid_period);
    u := upper(r.valid_period) - 1;

    if lower_inf(r.valid_period) or upper_inf(r.valid_period) or l = u then
      insert into unpacked(id, value, valid_period, transaction_period)
      values(r.id, r.value, r.valid_period, r.transaction_period);
    else
      for n in select * from generate_series(l, u)
      loop
        insert into unpacked(id, value, valid_period, transaction_period)
        values(r.id, r.value, int4range(n, n, '[]'), r.transaction_period);
      end loop;
    end if;
  end loop;
end; $body$ language plpgsql;

create procedure pack(filter text) as $body$
begin
  execute format('delete from packed as s where %s', filter);

  execute format($$insert into packed(id, value, valid_period, transaction_period)
                   select id
                        , value
                        , unnest(range_agg(valid_period)) as valid_period
                        , int4range(0, null, '[)')
                     from unpacked as s
                    where %s
                    group by id, value
                    order by valid_period$$, filter);
end; $body$ language plpgsql;

create procedure oracle_save_s(s_id s.id%type) as $body$
declare
  t int;
  vp s.valid_period%type;
  filter text := format('s.id = %s', quote_literal(s_id));
begin
  call unpack(filter);

  for t in 25 .. 54
  loop
    vp := int4range(t, t, '[]');

    insert into unpacked(id, value, valid_period, transaction_period)
    values (s_id, 0, vp, '[1,)')
    on conflict (id, valid_period)
    do update set value = 0;
  end loop;

  call pack(filter);
end; $body$ language plpgsql;

create procedure oracle_remove_s(filter text, s_valid_period s.valid_period%type) as $body$
declare
  t int;
  vp s.valid_period%type;
  clauses text[] default '{}';
  delete_filter text default '';
begin
  call unpack(filter);

  if length(filter) > 0 then
     clauses := clauses || filter;
  end if;

  if lower_inf(s_valid_period) and not upper_inf(s_valid_period) then
    clauses := clauses || format('upper(s.valid_period) <= %s', upper(s_valid_period));
  elseif not lower_inf(s_valid_period) and upper_inf(s_valid_period) then
    clauses := clauses || format('lower(s.valid_period) >= %s', lower(s_valid_period));
  elseif not lower_inf(s_valid_period) and not upper_inf(s_valid_period) then
    clauses := clauses || format('lower(s.valid_period) >= %s', lower(s_valid_period));
    clauses := clauses || format('upper(s.valid_period) <= %s', upper(s_valid_period));
  end if;

  select coalesce(string_agg(x, ' and '), '')
    into delete_filter
    from unnest(clauses) x;

  if length(delete_filter) > 0 then
    delete_filter := 'where ' || delete_filter;
  end if;

  execute format('delete from unpacked as "s" %s', delete_filter);

  call pack(filter);
end; $body$ language plpgsql;

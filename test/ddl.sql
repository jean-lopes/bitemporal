drop table if exists s cascade;
drop table if exists s_history cascade;

drop extension if exists btree_gist cascade;
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

create or replace function last_tx_time()
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

create or replace procedure save_s
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

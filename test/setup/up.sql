\set QUIET 'on'

create extension btree_gist;

create table s
    ( id                 text not null
    , value              int not null
    , valid_period       int4range not null
    , primary key(id, valid_period)
    , exclude using gist (id with =, valid_period with &&)
    , exclude using gist (id with =, value with =, valid_period with -|-) );

create table sp
    ( s_id text not null
    , id  text not null
    , state int not null
    , valid_period int4range not null
    , primary key(s_id, id, valid_period)
    , exclude using gist(s_id with =, id with =, valid_period with &&)
    , exclude using gist(s_id with =, id with =, state with =, valid_period with -|-) );

create procedure save_s
    ( s_id           s.id%type
    , s_value        s.value%type
    , s_valid_period s.valid_period%type )
as $body$
declare
    r   s;
    vps int4multirange;
    vp  s.valid_period%type;
begin
    if isempty(s_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %)', s_id, s_valid_period;
    for r in select id
                  , value
                  , valid_period
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
end; $body$ language plpgsql;

create procedure save_sp
    ( sp_s_id         sp.s_id%type
    , sp_id           sp.id%type
    , sp_state        sp.state%type
    , sp_valid_period sp.valid_period%type )
as $body$
declare
    r   sp;
    vps int4multirange;
    vp  sp.valid_period%type;
begin
    if isempty(sp_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %, %)', sp_s_id, sp_id, sp_valid_period;
    for r in select s_id
                  , id
                  , state
                  , valid_period
               from sp
              where s_id = sp_s_id
                and id = sp_id
                and valid_period && sp_valid_period
    loop
        raise debug 'found overlapping record: (%, %, %, %)', r.s_id, r.id, r.state, r.valid_period;

        vps := r.valid_period::int4multirange - sp_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %, %)', r.s_id, r.id, r.valid_period;
        delete from sp
        where s_id = r.s_id
          and id = r.id
          and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                if not isempty(vp) then
                    raise debug 'inserting unmatched part of overlapped record with period: (%, %, %, %)', r.s_id, r.id, r.state, vp;
                    insert into sp(s_id, id, state, valid_period) values(r.s_id, r.id, r.state, vp);
                end if;
            end loop;
        end if;
    end loop;

    raise debug 'checking for adjacency: (%, %, %, %)', sp_s_id, sp_id, sp_state, sp_valid_period;

    select range_agg(x.valid_period)
      into vps
      from (select sp_valid_period as "valid_period"
             union all
            select valid_period
              from sp
             where s_id = sp_s_id
               and id = sp_id
               and state = sp_state
               and valid_period -|- sp_valid_period) x;

    raise debug 'vps: %', vps;

    if not isempty(vps) then
        foreach vp in array (select array_agg(x.*) from unnest(vps) x)
        loop
            raise debug 'vp: %', vp;

            raise debug 'deleting adjacents: (%, %, %, %)', sp_s_id, sp_id, sp_state, sp_valid_period;
            delete from sp
            where s_id = sp_s_id
              and id = sp_id
              and state = sp_state
              and valid_period -|- sp_valid_period;

            raise debug 'inserting consolidated record: (%, %, %, %)', sp_s_id, sp_id, sp_state, vp;
            insert into sp(s_id, id, state, valid_period) values (sp_s_id, sp_id, sp_state, vp);
            return;
        end loop;
    end if;

    raise debug 'inserting desired record: (%, %, %, %)', sp_s_id, sp_id, sp_state, sp_valid_period;
    insert into sp(s_id, id, state, valid_period) values(sp_s_id, sp_id, sp_state, sp_valid_period);
end; $body$ language plpgsql;

create or replace procedure remove_sp
    ( filter          text
    , sp_valid_period sp.valid_period%type )
as $body$
declare
    r   sp;
    vps int4multirange;
    vp  sp.valid_period%type;
begin
    raise debug 'remove_sp(filter=%, sp_valid_period=%)', quote_literal(filter), quote_literal(sp_valid_period);

    if isempty(sp_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %)', filter, sp_valid_period;
    for r in execute format($$select *
                                from sp as "x"
                               where %s
                                 and x.valid_period && %s$$
                           , filter
                           , quote_literal(sp_valid_period))
    loop
        raise debug 'found overlapping record: (%, %, %, %)', r.s_id, r.id, r.state, r.valid_period;

        vps := r.valid_period::int4multirange - sp_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %, %)', r.s_id, r.id, r.valid_period;
        delete from sp
              where s_id = r.s_id
                and id = r.id
                and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                raise debug 'inserting remaining part of overlapped record: (%, %, %, %)', r.s_id, r.id, r.state, vp;
                insert into sp(s_id, id, state, valid_period) values(r.s_id, r.id, r.state, vp);
            end loop;
        end if;
    end loop;
end; $body$ language plpgsql;

create or replace procedure remove_cascade_sp
    ( filter         text
    , sp_valid_period s.valid_period%type )
as $body$
begin
    raise debug 'remove_cascade_sp(filter=%, sp_valid_period=%)', quote_literal(filter), quote_literal(sp_valid_period);

    if isempty(sp_valid_period) then
        raise exception 'empty valid time';
    end if;

    call remove_sp(filter, sp_valid_period);
end; $body$ language plpgsql;

create or replace procedure remove_s
    ( filter         text
    , s_valid_period s.valid_period%type )
as $body$
declare
    r s;
    vps int4multirange;
    vp s.valid_period%type;
begin
    raise debug 'remove_s(filter=%, s_valid_period=%)', quote_literal(filter), quote_literal(s_valid_period);

    if isempty(s_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %)', filter, s_valid_period;
    for r in execute format($$select x.id
                                   , x.value
                                   , x.valid_period
                                from s as "x"
                               where %s
                                 and x.valid_period && %s$$
                           , filter
                           , quote_literal(s_valid_period))
    loop
        raise debug 'found overlapping record: (%, %, %)', r.id, r.value, r.valid_period;

        vps := r.valid_period::int4multirange - s_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %)', r.id, r.valid_period;
        delete from s
              where id = r.id
                and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                raise debug 'inserting remaining part of overlapped record: (%, %, %)', r.id, r.value, vp;
                insert into s(id, value, valid_period) values(r.id, r.value, vp);
            end loop;
        end if;
    end loop;
end; $body$ language plpgsql;

create or replace procedure remove_cascade_s
    ( filter         text
    , s_valid_period s.valid_period%type )
as $body$
declare
    r sp;
begin
    raise debug 'remove_cascade_s(filter=%, s_valid_period=%)', quote_literal(filter), quote_literal(s_valid_period);

    if isempty(s_valid_period) then
        raise exception 'empty valid time';
    end if;

    call remove_cascade_sp(format('x.s_id in (select id from s as x where %s and x.valid_period && %s)', filter, quote_literal(s_valid_period)), s_valid_period);

    call remove_s(filter, s_valid_period);
end; $body$ language plpgsql;

create or replace function check_fk_s_sp()
   returns trigger
   language plpgsql
as $body$
declare
  r   sp;
  rs  sp[] default '{}';
begin
  for r in with x as (select id
                           , range_agg(valid_period) as "valid_period"
                        from s
                       group by id)
         select sp.*
           from sp, x
          where x.id = sp.s_id
            and not x.valid_period @> sp.valid_period
          union all
         select sp.*
           from sp
      left join x on x.id = sp.s_id
          where x.id is null
  loop
      rs := rs || r;
  end loop;

  if array_length(rs, 1) <> 0 then
    raise exception 'invalid state, violating records on SP: %', rs;
  end if;

  return new;
end; $body$;

create constraint trigger sp_check_fk_s
    after insert or update or delete on sp
    initially deferred
    for each row
    execute function check_fk_s_sp();

create constraint trigger s_check_fk_sp
    after insert or update or delete on s
    initially deferred
    for each row
    execute function check_fk_s_sp();

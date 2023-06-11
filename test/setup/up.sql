\set QUIET 'on'

create extension btree_gist;

create schema sample;

create table sample.s
    ( id                text not null
    , value             int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, valid_period)
    , exclude using gist (id with =, valid_period with &&)
    , exclude using gist (id with =, value with =, valid_period with -|-) );

create table sample.sp
    ( s_id              text not null
    , id                text not null
    , state             int not null
    , valid_period      int4range not null
    , primary key(s_id, id, valid_period)
    , exclude using gist(s_id with =, id with =, valid_period with &&)
    , exclude using gist(s_id with =, id with =, state with =, valid_period with -|-) );

create procedure sample.save_s
    ( s_id           sample.s.id%type
    , s_value        sample.s.value%type
    , s_valid_period sample.s.valid_period%type )
as $body$
declare
    r   sample.s;
    vps int4multirange;
    vp  sample.s.valid_period%type;
    t   int;
begin
    if isempty(s_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %)', s_id, s_valid_period;
    for r in select id
                  , value
                  , valid_period
               from sample.s
              where id = s_id
                and valid_period && s_valid_period
    loop
        raise debug 'found overlapping record: (%, %, %)', r.id, r.value, r.valid_period;

        vps := r.valid_period::int4multirange - s_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %)', r.id, r.valid_period;
        delete from sample.s where id = r.id and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                if not isempty(vp) then
                    raise debug 'inserting unmatched part of overlapped record with period: (%, %, %)', r.id, r.value, vp;
                    insert into sample.s(id, value, valid_period) values(r.id, r.value, vp);
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
              from sample.s
             where id = s_id
               and value = s_value
               and valid_period -|- s_valid_period) x     ;

    raise debug 'vps: %', vps;

    if not isempty(vps) then
        foreach vp in array (select array_agg(x.*) from unnest(vps) x)
        loop
            raise debug 'vp: %', vp;

            raise debug 'deleting adjacents: (%, %, %)', s_id, s_value, s_valid_period;
            delete from sample.s where id = s_id and value = s_value and valid_period -|- s_valid_period;

            raise debug 'inserting consolidated record: (%, %, %)', s_id, s_value, vp;
            insert into sample.s(id, value, valid_period) values (s_id, s_value, vp);
            return;
        end loop;
    end if;

    raise debug 'inserting desired record: (%, %, %)', s_id, s_value, s_valid_period;
    insert into sample.s(id, value, valid_period) values(s_id, s_value, s_valid_period);
end; $body$ language plpgsql;

create procedure sample.save_sp
    ( sp_s_id         sample.sp.s_id%type
    , sp_id           sample.sp.id%type
    , sp_state        sample.sp.state%type
    , sp_valid_period sample.sp.valid_period%type )
as $body$
declare
    r   sample.sp;
    vps int4multirange;
    vp  sample.sp.valid_period%type;
begin
    if isempty(sp_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %, %)', sp_s_id, sp_id, sp_valid_period;
    for r in select s_id
                  , id
                  , state
                  , valid_period
               from sample.sp
              where s_id = sp_s_id
                and id = sp_id
                and valid_period && sp_valid_period
    loop
        raise debug 'found overlapping record: (%, %, %, %)', r.s_id, r.id, r.state, r.valid_period;

        vps := r.valid_period::int4multirange - sp_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %, %)', r.s_id, r.id, r.valid_period;
        delete from sample.sp
              where s_id = r.s_id
                and id = r.id
                and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                if not isempty(vp) then
                    raise debug 'inserting unmatched part of overlapped record with period: (%, %, %, %)', r.s_id, r.id, r.state, vp;
                    insert into sample.sp(s_id, id, state, valid_period) values(r.s_id, r.id, r.state, vp);
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
              from sample.sp
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
            delete from sample.sp
            where s_id = sp_s_id
              and id = sp_id
              and state = sp_state
              and valid_period -|- sp_valid_period;

            raise debug 'inserting consolidated record: (%, %, %, %)', sp_s_id, sp_id, sp_state, vp;
            insert into sample.sp(s_id, id, state, valid_period) values (sp_s_id, sp_id, sp_state, vp);
            return;
        end loop;
    end if;

    raise debug 'inserting desired record: (%, %, %, %)', sp_s_id, sp_id, sp_state, sp_valid_period;
    insert into sample.sp(s_id, id, state, valid_period) values(sp_s_id, sp_id, sp_state, sp_valid_period);
end; $body$ language plpgsql;

create or replace procedure sample.remove_sp
    ( filter          text
    , sp_valid_period sample.sp.valid_period%type )
as $body$
declare
    r   sample.sp;
    vps int4multirange;
    vp  sample.sp.valid_period%type;
begin
    raise debug 'sample.remove_sp(filter=%, sp_valid_period=%)', quote_literal(filter), quote_literal(sp_valid_period);

    if isempty(sp_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %)', filter, sp_valid_period;
    for r in execute format($$select *
                                from sample.sp as "x"
                               where %s
                                 and x.valid_period && %s$$
                           , filter
                           , quote_literal(sp_valid_period))
    loop
        raise debug 'found overlapping record: (%, %, %, %)', r.s_id, r.id, r.state, r.valid_period;

        vps := r.valid_period::int4multirange - sp_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %, %)', r.s_id, r.id, r.valid_period;
        delete from sample.sp
              where s_id = r.s_id
                and id = r.id
                and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                raise debug 'inserting remaining part of overlapped record: (%, %, %, %)', r.s_id, r.id, r.state, vp;
                insert into sample.sp(s_id, id, state, valid_period) values(r.s_id, r.id, r.state, vp);
            end loop;
        end if;
    end loop;
end; $body$ language plpgsql;

create or replace procedure sample.remove_cascade_sp
    ( filter          text
    , sp_valid_period sample.s.valid_period%type )
as $body$
begin
    raise debug 'sample.remove_cascade_sp(filter=%, sp_valid_period=%)', quote_literal(filter), quote_literal(sp_valid_period);

    if isempty(sp_valid_period) then
        raise exception 'empty valid time';
    end if;

    call sample.remove_sp(filter, sp_valid_period);
end; $body$ language plpgsql;

create or replace procedure sample.remove_s
    ( filter         text
    , s_valid_period sample.s.valid_period%type )
as $body$
declare
    r   sample.s;
    vps int4multirange;
    vp  sample.s.valid_period%type;
begin
    raise debug 'sample.remove_s(filter=%, s_valid_period=%)', quote_literal(filter), quote_literal(s_valid_period);

    if isempty(s_valid_period) then
        raise exception 'empty valid time';
    end if;

    raise debug 'checking for overlaps: (%, %)', filter, s_valid_period;
    for r in execute format($$select x.id
                                   , x.value
                                   , x.valid_period
                                from sample.s as "x"
                               where %s
                                 and x.valid_period && %s$$
                           , filter
                           , quote_literal(s_valid_period))
    loop
        raise debug 'found overlapping record: (%, %, %)', r.id, r.value, r.valid_period;

        vps := r.valid_period::int4multirange - s_valid_period::int4multirange;
        raise debug 'vps: %', vps;

        raise debug 'deleting record by PK (%, %)', r.id, r.valid_period;
        delete from sample.s
              where id = r.id
                and valid_period = r.valid_period;

        if not isempty(vps) then
            foreach vp in array (select array_agg(x.*) from unnest(vps) x)
            loop
                raise debug 'inserting remaining part of overlapped record: (%, %, %)', r.id, r.value, vp;
                insert into sample.s(id, value, valid_period) values(r.id, r.value, vp);
            end loop;
        end if;
    end loop;
end; $body$ language plpgsql;

create or replace procedure sample.remove_cascade_s
    ( filter         text
    , s_valid_period sample.s.valid_period%type )
as $body$
declare
    r sample.sp;
begin
    raise debug 'sample.remove_cascade_s(filter=%, s_valid_period=%)', quote_literal(filter), quote_literal(s_valid_period);

    if isempty(s_valid_period) then
        raise exception 'empty valid time';
    end if;

    call sample.remove_cascade_sp(format('x.s_id in (select id from sample.s as x where %s and x.valid_period && %s)', filter, quote_literal(s_valid_period)), s_valid_period);

    call sample.remove_s(filter, s_valid_period);
end; $body$ language plpgsql;

create or replace function sample.check_fk_s_sp()
   returns trigger
   language plpgsql
as $body$
declare
  r   sample.sp;
  rs  sample.sp[] default '{}';
begin
  for r in with x as (select id
                           , range_agg(valid_period) as "valid_period"
                        from sample.s
                       group by id)
         select sp.*
           from sample.sp as sp, x
          where x.id = sp.s_id
            and not x.valid_period @> sp.valid_period
          union all
         select sp.*
           from sample.sp as sp
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
    after insert or update or delete on sample.sp
    initially deferred
    for each row
    execute function sample.check_fk_s_sp();

create constraint trigger s_check_fk_sp
    after insert or update or delete on sample.s
    initially deferred
    for each row
    execute function sample.check_fk_s_sp();

create schema bitemporal;

create table bitemporal.foreign_keys
    ( parent            regclass not null
    , parent_columns    name[]   not null
    , child             regclass not null
    , child_columns     name[]   not null
    , primary key(parent, child, child_columns) );

insert into bitemporal.foreign_keys(parent, parent_columns, child, child_columns)
values ('sample.s', '{id}', 'sample.sp', '{s_id}');

create schema sample_history;

create table sample_history.s (like sample.s);

create table sample_history.sp (like sample.sp);

create or replace function sample_history.truncate_history()
returns trigger
language plpgsql
as $body$
begin
    execute format('truncate %s_history.%s', tg_table_schema, tg_table_name);
    return null;
end; $body$;

create sequence sample_history.system_time increment by 1
    minvalue 0
    start  with 0;

create or replace function sample_history.log_history_s()
returns trigger
language plpgsql
as $body$
declare
    t int;
begin
    select last_value into t from sample_history.system_time;
    raise debug 'sample_history.log_history_s()@%', t;

    insert into sample_history.s(id, value, valid_period, system_period)
    select id
         , value
         , valid_period
         , int4range( lower(system_period)
                    , (select nextval('sample_history.system_time')::int) )
      from old_table;

    return null;
end; $body$;

create trigger s_history_upt
    after update on sample.s
    referencing old table as old_table
    for each statement
    execute function sample_history.log_history_s();

create trigger s_history_del
    after delete on sample.s
    referencing old table as old_table
    for each statement
    execute function sample_history.log_history_s();

create trigger s_truncate_history
    after truncate on sample.s
    for each statement
    execute function sample_history.truncate_history();

create or replace function sample_history.set_system_period_s()
returns trigger
language plpgsql
as $body$
declare
    t int;
begin
    select last_value into t from sample_history.system_time;
    raise debug 'sample_history.set_system_period_s(%)@%', new, t;

    select int4range((select nextval('sample_history.system_time')::int), null)
    into new.system_period;

    return new;
end; $body$;

create trigger s_system_time_before
    before insert or update on sample.s
    for each row
    execute function sample_history.set_system_period_s();

create schema bitemporal;

create or replace function bitemporal.identity(text)
returns text
language sql
immutable
as $$ select $1 $$;

create or replace function bitemporal.append_history(text)
returns text
language sql
immutable
as $$ select $1||'_history' $$;

create type bitemporal.range_type
    as enum ( 'integer'
            , 'bigint'
            , 'numeric'
            , 'timestamp'
            , 'timestamptz'
            , 'date' );

create or replace function bitemporal.get_range_type
    ( range_type bitemporal.range_type )
returns regtype
language sql
immutable
returns null on null input
return case range_type
               when 'integer'      then 'int4range'
               when 'bigint'       then 'int8range'
               when 'numeric'      then 'numrange'
               when 'timestamp'    then 'tsrange'
               when 'timestamptz'  then 'tstzrange'
               when 'date'         then 'daterange'
           end::regtype;

create or replace function bitemporal.get_multirange_type
    ( range_type bitemporal.range_type )
returns regtype
language sql
immutable
returns null on null input
return case range_type
            when 'integer'      then 'int4multirange'
            when 'bigint'       then 'int8multirange'
            when 'numeric'      then 'nummultirange'
            when 'timestamp'    then 'tsmultirange'
            when 'timestamptz'  then 'tstzmultirange'
            when 'date'         then 'datemultirange'
          end::regtype;

create table bitemporal.configuration
    ( id                          boolean generated always as (true) stored unique --make this table accept only one row :)
    , valid_time_name             name
    , valid_time_type             bitemporal.range_type not null
    , valid_time_range            regtype not null generated always as (bitemporal.get_range_type(valid_time_type)) stored
    , valid_time_multirange       regtype not null generated always as (bitemporal.get_multirange_type(valid_time_type)) stored
    , system_time_name            name
    , system_time_type            bitemporal.range_type not null
    , system_time_range           regtype not null generated always as (bitemporal.get_range_type(system_time_type)) stored
    , system_time_multirange      regtype not null generated always as (bitemporal.get_multirange_type(system_time_type)) stored
    , system_time_current_time_fn text not null
    , history_namespace_name_fn   regproc not null default 'bitemporal.append_history'
    , history_relation_name_fn    regproc not null default 'bitemporal.identity'
    , debug                       boolean not null default false);

create table bitemporal.foreign_keys
    ( parent            regclass not null
    , parent_columns    name[]   not null
    , child             regclass not null
    , child_columns     name[]   not null
    , primary key(parent, child, child_columns) );

create or replace function bitemporal.get_configuration()
returns bitemporal.configuration
language plpgsql
stable
as $body$
declare
    cfg bitemporal.configuration;
begin
    select *
      into cfg
      from bitemporal.configuration;

    if not found then
        raise exception 'Empty table "bitemporal.configuration"';
    end if;

    return cfg;
end; $body$;

create or replace function bitemporal.history_namespace_name
    ( relid regclass )
returns name
language plpgsql
stable
as $body$
declare
    cfg     bitemporal.configuration;
    ns      text;
    hist_ns text;
begin
    cfg := bitemporal.get_configuration();

    ns := split_part(relid::text, '.', 1);

    execute format( 'select %s(%s)::text'
                  , cfg.history_namespace_name_fn
                  , quote_literal(ns) )
       into hist_ns;

    return hist_ns;
end; $body$;

-- comment: return regclass or null
create or replace function bitemporal.history_namespace_id
    ( relid regclass )
returns regnamespace
language plpgsql
stable
as $body$
begin
    return to_regnamespace(bitemporal.history_namespace_name(relid));
end $body$;

create or replace function bitemporal.history_relation_name
    ( relid regclass )
returns name
language plpgsql
stable
as $body$
declare
    cfg      bitemporal.configuration;
    rel      text;
    hist_rel text;
begin
    cfg := bitemporal.get_configuration();

    rel := split_part(relid::text, '.', 2);

    execute format( 'select %s(%s)::text'
                  , cfg.history_relation_name_fn
                  , quote_literal(rel) )
       into hist_rel;

    return hist_rel;
end $body$;

-- comment: return regclass or null
create or replace function bitemporal.history_relation_id
    ( relid regclass )
returns regclass
language plpgsql
stable
as $body$
declare
  ns  name;
  rel name;
begin
    ns := bitemporal.history_namespace_name(relid);
    rel := bitemporal.history_relation_name(relid);
    return to_regclass(format('%s.%s', ns, rel));
end $body$;

create or replace function bitemporal.sort_array(anyarray)
returns anyarray
language sql
immutable
as $body$ select array(select unnest($1) order by 1) $body$;

create or replace function bitemporal.overlap_operator_for(name)
returns name
language sql
stable
as $body$
    select case $1
             when valid_time_name then '&&'
             else '='
           end
      from bitemporal.configuration
$body$;

create or replace function bitemporal.adjacency_operator_for(name)
returns name
language sql
stable
as $body$
    select case $1
             when valid_time_name then '-|-'
             else '='
           end
      from bitemporal.configuration
$body$;

create or replace function bitemporal.primary_key_errors
    ( relid regclass )
returns table
    ( namespace name
    , relation  name
    , message   text )
language plpgsql
stable
as $body$
declare
  cfg bitemporal.configuration;
  r   record;
begin
    cfg := bitemporal.get_configuration();

    select relnamespace::regnamespace::text
         , relname
      into namespace
         , relation
      from pg_class
     where oid = relid;

    select 1
      into r
      from pg_constraint
     where contype = 'p'
       and conrelid = relid;

    if not found then
        message := 'Missing primary key';
        return next;
        return;
    end if;

    with c as (select conrelid
                    , conname
                    , unnest(conkey) as "attnum"
                 from pg_constraint
                where contype = 'p'
                  and conrelid = relid
                order by attnum)
    select 1
      into r
      from c
      join pg_attribute as "a" on a.attrelid = c.conrelid and a.attnum = c.attnum
     where a.attname = cfg.valid_time_name;

    if not found then
        message := format('Missing attribute "%s" on primary key', cfg.valid_time_name);
        return next;
    end if;

    return;
end $body$;

create or replace function bitemporal.valid_time_errors
    ( relid regclass )
returns table
    ( namespace name
    , relation  name
    , message   text )
language plpgsql
stable
as $body$
declare
  cfg bitemporal.configuration;
  r   record;
begin
    cfg := bitemporal.get_configuration();

    select relnamespace::regnamespace::text
         , relname
      into namespace
         , relation
      from pg_class
     where oid = relid;

    select atttypid::regtype as "atttypname"
         , attnotnull
      into r
      from pg_attribute
     where attrelid = relid
       and attname = cfg.valid_time_name
       and not attisdropped;

    if not found then
       message := format('Missing attribute "%s"', cfg.valid_time_name);
       return next;
       return;
    end if;

    if not r.attnotnull then
       message := format('Attribute "%s" should be not nullable', cfg.valid_time_name);
       return next;
    end if;

    if r.atttypname <> cfg.valid_time_range then
       message := format('Attribute "%s" with invalid type. Expected: "%s", found: "%s"'
                        , cfg.valid_time_name
                        , cfg.valid_time_range::text
                        , r.atttypname );
       return next;
    end if;

    return;
end $body$;

create or replace function bitemporal.system_time_errors
    ( relid regclass )
returns table
    ( namespace name
    , relation  name
    , message   text )
language plpgsql
stable
as $body$
declare
  cfg bitemporal.configuration;
  r   record;
begin
    cfg := bitemporal.get_configuration();

    select relnamespace::regnamespace::text
         , relname
      into namespace
         , relation
      from pg_class
     where oid = relid;

    select atttypid::regtype as "atttypname"
         , attnotnull
      into r
      from pg_attribute
     where attrelid = relid
       and attname = cfg.system_time_name
       and not attisdropped;

    if not found then
       message := format('Missing attribute "%s"', cfg.system_time_name);
       return next;
       return;
    end if;

    if not r.attnotnull then
       message := format('Attribute "%s" should be not nullable', cfg.system_time_name);
       return next;
    end if;

    if r.atttypname <> cfg.system_time_range then
       message := format('Attribute "%s" with invalid type. Expected: "%s", found: "%s"'
                        , cfg.system_time_name
                        , cfg.system_time_range::text
                        , r.atttypname );
       return next;
    end if;

    return;
end $body$;

create or replace function bitemporal.overlap_constraint_errors
    ( relid regclass )
returns table
    ( namespace name
    , relation  name
    , message   text )
language plpgsql
stable
as $body$
declare
    r record;
    e record;
begin
    select relnamespace::regnamespace
         , relname
      into namespace
         , relation
      from pg_class
     where oid = relid;

    select c.conrelid
         , c.conkey
         , array_agg(a.attname) as "attnames"
         , array_agg(bitemporal.overlap_operator_for(a.attname)) as "oprnames"
      into e
      from (select x.conrelid
                 , x.conkey
                 , unnest(x.conkey) as "attnum"
              from (select conrelid
                         , bitemporal.sort_array(conkey) as "conkey"
                      from pg_constraint
                     where conrelid = relid
                       and contype = 'p') x
             order by attnum asc) c
      join pg_attribute a on a.attrelid = c.conrelid and a.attnum = c.attnum
     group by c.conrelid, c.conkey;

    for r in with pgc as (select oid
                               , conname
                               , conrelid
                               , unnest(conkey) as "attnum"
                               , unnest(conexclop) as "opoid"
                            from pg_constraint
                           where conrelid = relid
                             and contype = 'x'
                           order by oid, attnum)
                , aex as (select pgc.oid
                               , pgc.conname
                               , pgc.conrelid
                               , pgc.attnum
                               , pgc.opoid
                               , a.attname
                               , o.oprname
                            from pgc
                            join pg_attribute a on a.attrelid = pgc.conrelid and a.attnum = pgc.attnum
                            join pg_operator o on o.oid = pgc.opoid)
                , bex as (select oid
                               , conname
                               , array_agg(attnum) as "conkey"
                               , array_agg(attname) as "attnames"
                               , array_agg(oprname) as "oprnames"
                           from aex
                          group by oid, conname)
                , cex as (select oid
                               , conname
                               , conkey
                               , attnames
                               , oprnames
                               , oprnames = e.oprnames as "is_ok"
                            from bex
                           where conkey = e.conkey)
             select conname
                  , unnest(attnames) as "attname"
                  , unnest(oprnames) as "oprname"
                  , unnest(e.oprnames) as "expected_oprname"
                  , is_ok
               from cex
              order by is_ok desc
    loop
        if r.is_ok then
            return;
        end if;

        if r.oprname <> r.expected_oprname then
            message := format( 'Invalid operator on constraint "%s" for attribute "%s". Expected: "%s", found: "%s"'
                             , r.conname
                             , r.attname
                             , r.expected_oprname
                             , r.oprname );
            return next;
        end if;
    end loop;

    if not found then
        message := 'Missing exclude overlap constraint';
        return next;
    end if;

    return;
end; $body$;

create or replace function bitemporal.adjacency_constraint_errors
    ( relid regclass )
returns table
    ( namespace name
    , relation  name
    , message   text )
language plpgsql
stable
as $body$
declare
    r record;
    e record;
begin
    select relnamespace::regnamespace
         , relname
      into namespace
         , relation
      from pg_class
     where oid = relid;

    select array_agg(attnum) as "conkey"
         , array_agg(attname) as "attnames"
         , array_agg(oprname) as "oprnames"
      into e
      from (select attnum
                 , attname
                 , bitemporal.adjacency_operator_for(attname) as "oprname"
            from pg_attribute
            where attrelid = relid
              and attnum > 0
              and not attisdropped
              and attname not in (select system_time_name from bitemporal.configuration)
            order by attnum) x;

    for r in with x as (select oid
                             , conrelid
                             , conname
                             , unnest(conkey) as "attnum"
                             , unnest(conexclop) as "oproid"
                          from pg_constraint
                        where conrelid = relid
                          and contype = 'x'
                        order by oid, attnum)
                , y as (select x.oid, x.conrelid, x.conname, x.attnum, x.oproid
                             , a.attname
                             , o.oprname
                          from x
                          join pg_attribute a on a.attrelid = x.conrelid and a.attnum = x.attnum
                          join pg_operator o on o.oid = x.oproid)
                , z as (select y.oid
                             , y.conrelid
                             , y.conname
                             , y.attnum
                             , y.attname
                             , y.oprname
                             , array_agg(y.attnum) over (partition by y.oid) as "conkey"
                             , array_agg(y.oprname) over (partition by y.oid) as "conexclopnames"
                          from y group by y.oid, y.conrelid, y.conname, y.attnum, y.attname, y.oprname)
           select z.conexclopnames = e.oprnames is_ok
                , z.conname
                , z.attname
                , z.oprname
                , bitemporal.adjacency_operator_for(z.attname) as "expected_oprname"
             from z
            where z.conkey = e.conkey
            order by 1 desc, z.oid, z.attnum
    loop
        if r.is_ok then
            return;
        end if;

        if r.oprname <> r.expected_oprname then
            message := format( 'Invalid operator on constraint "%s" for attribute "%s". Expected: "%s", found: "%s"'
                             , r.conname
                             , r.attname
                             , r.expected_oprname
                             , r.oprname );
            return next;
        end if;
    end loop;

    if not found then
        message := 'Missing exclude adjacency constraint';
        return next;
    end if;

    return;
end; $body$;

create or replace function bitemporal.history_relation_errors
    ( relid regclass )
returns table
    ( namespace name
    , relation  name
    , message   text )
language plpgsql
immutable
as $body$
declare
    cfg        bitemporal.configuration;
    hist_ns    text;
    hist_rel   text;
    hist_relid regclass;
    r          record;
begin
    cfg := bitemporal.get_configuration();

    select relnamespace::regnamespace
         , relname
      into namespace
         , relation
      from pg_class
      where oid = relid;

    hist_ns := bitemporal.history_namespace_name(relid);
    hist_rel := bitemporal.history_relation_name(relid);
    hist_relid := bitemporal.history_relation_id(relid);

    if hist_relid is null then
        message := format('Missing history relation "%s.%s"', hist_ns, hist_rel);
        return next;
        return;
    end if;

    namespace := hist_ns;
    relation := hist_rel;

    for r in select a.attname
                  , a.atttypid
                  , h.attname as "hist_attname"
                  , h.atttypid as "hist_atttypid"
                  , h.attname is null "is_missing_attribute"
                  , h.atttypid is null or a.atttypid <> h.atttypid "is_type_mismatch"
             from pg_attribute as "a"
        left join pg_attribute as "h" on h.attrelid = hist_relid and h.attname = a.attname and not h.attisdropped
            where a.attrelid = relid
              and a.attnum > 0
              and not a.attisdropped
    loop
        if r.is_missing_attribute then
            message := format('Missing attribute "%s"', r.attname);
            return next;
        elsif r.is_type_mismatch then
            message := format( 'Mismatched type on attribute "%s". Expected "%s", found "%s"'
                             , r.attname
                             , r.atttypid::regtype::text
                             , r.hist_atttypid::regtype::text );
            return next;
        end if;
    end loop;

    return;
end $body$;

create or replace function bitemporal.relation_errors
    ( relid regclass )
returns table
    ( namespace name
    , relation  name
    , message   text )
language plpgsql
stable
as $body$
begin
    return query select x.namespace
                      , x.relation
                      , x.message
                   from bitemporal.valid_time_errors(relid) x;

    return query select x.namespace
                      , x.relation
                      , x.message
                   from bitemporal.system_time_errors(relid) x;

    return query select x.namespace
                      , x.relation
                      , x.message
                   from bitemporal.primary_key_errors(relid) x;

    return query select x.namespace
                      , x.relation
                      , x.message
                   from bitemporal.overlap_constraint_errors(relid) x;

    return query select x.namespace
                      , x.relation
                      , x.message
                   from bitemporal.adjacency_constraint_errors(relid) x;

    return query select x.namespace
                      , x.relation
                      , x.message
                   from bitemporal.history_relation_errors(relid) x;

    -- TODO: generated triggers
    -- TODO: generated procedures
    -- TODO: invalid table type (information_schema.tables.type)

    return;
end $body$;

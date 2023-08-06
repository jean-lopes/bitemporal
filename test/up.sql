\set QUIET 'on'

create extension btree_gist;

insert into bitemporal.configuration(valid_time_name, valid_time_type, system_time_name, system_time_type, system_time_current_time_fn)
values ('valid_period', 'integer', 'system_period', 'integer', '');

-- insert into bitemporal.foreign_keys(parent, parent_columns, child, child_columns)
-- values ('sample.s', '{id}', 'sample.sp', '{s_id}');

-- create or replace function bitemporal.overlap_constraint_errors
--     ( relid regclass )
-- returns table
--     ( namespace name
--     , relation  name
--     , message   text )
-- language plpgsql
-- stable
-- as $body$
-- declare
--     r record;
--     e record;
-- begin
--     select relnamespace::regnamespace
--          , relname
--       into namespace
--          , relation
--       from pg_class
--      where oid = relid;

--     select c.conrelid
--          , c.conkey
--          , array_agg(a.attname) as "attnames"
--          , array_agg(bitemporal.overlap_operator_for(a.attname)) as "oprnames"
--       into e
--       from (select x.conrelid
--                  , x.conkey
--                  , unnest(x.conkey) as "attnum"
--               from (select conrelid
--                          , bitemporal.sort_array(conkey) as "conkey"
--                       from pg_constraint
--                      where conrelid = relid
--                        and contype = 'p') x
--              order by attnum asc) c
--       join pg_attribute a on a.attrelid = c.conrelid and a.attnum = c.attnum
--      group by c.conrelid, c.conkey;

--     for r in with pgc as (select oid
--                                , conname
--                                , conrelid
--                                , unnest(conkey) as "attnum"
--                                , unnest(conexclop) as "opoid"
--                             from pg_constraint
--                            where conrelid = relid
--                              and contype = 'x'
--                            order by oid, attnum)
--                 , aex as (select pgc.oid
--                                , pgc.conname
--                                , pgc.conrelid
--                                , pgc.attnum
--                                , pgc.opoid
--                                , a.attname
--                                , o.oprname
--                             from pgc
--                             join pg_attribute a on a.attrelid = pgc.conrelid and a.attnum = pgc.attnum
--                             join pg_operator o on o.oid = pgc.opoid)
--                 , bex as (select oid
--                                , conname
--                                , array_agg(attnum) as "conkey"
--                                , array_agg(attname) as "attnames"
--                                , array_agg(oprname) as "oprnames"
--                            from aex
--                           group by oid, conname)
--                 , cex as (select oid
--                                , conname
--                                , conkey
--                                , attnames
--                                , oprnames
--                                , oprnames = e.oprnames as "is_ok"
--                             from bex
--                            where conkey = e.conkey)
--              select conname
--                   , unnest(attnames) as "attname"
--                   , unnest(oprnames) as "oprname"
--                   , unnest(e.oprnames) as "expected_oprname"
--                   , is_ok
--                from cex
--               order by is_ok desc
--     loop
--         if r.is_ok then
--             return;
--         end if;

--         if r.oprname <> r.expected_oprname then
--             message := format( '"%s": Invalid operator on attribute "%s". Expected: "%s", found: "%s"'
--                              , r.conname
--                              , r.attname
--                              , r.expected_oprname
--                              , r.oprname );
--             return next;
--         end if;
--     end loop;

--     if not found then
--         message := 'Missing exclude overlap constraint';
--         return next;
--     end if;

--     return;
-- end; $body$;

-- create or replace function bitemporal.adjacency_constraint_errors
--     ( relid regclass )
-- returns table
--     ( namespace       name
--     , relation        name
--     , message         text )
-- language plpgsql
-- stable
-- as $body$
-- declare
--     r record;
--     e record;
-- begin
--     select relnamespace::regnamespace
--          , relname
--       into namespace
--          , relation
--       from pg_class
--      where oid = relid;

--     select array_agg(attnum) as "conkey"
--          , array_agg(attname) as "attnames"
--          , array_agg(oprname) as "oprnames"
--       into e
--       from (select attnum
--                  , attname
--                  , bitemporal.adjacency_operator_for(attname) as "oprname"
--             from pg_attribute
--             where attrelid = relid
--               and attnum > 0
--               and not attisdropped
--               and attname not in (select system_time_name from bitemporal.params)
--             order by attnum) x;

--     for r in with x as (select oid
--                              , conrelid
--                              , conname
--                              , unnest(conkey) as "attnum"
--                              , unnest(conexclop) as "oproid"
--                           from pg_constraint
--                         where conrelid = relid
--                           and contype = 'x'
--                         order by oid, attnum)
--                 , y as (select x.oid, x.conrelid, x.conname, x.attnum, x.oproid
--                              , a.attname
--                              , o.oprname
--                           from x
--                           join pg_attribute a on a.attrelid = x.conrelid and a.attnum = x.attnum
--                           join pg_operator o on o.oid = x.oproid)
--                 , z as (select y.oid
--                              , y.conrelid
--                              , y.conname
--                              , y.attnum
--                              , y.attname
--                              , y.oprname
--                              , array_agg(y.attnum) over (partition by y.oid) as "conkey"
--                              , array_agg(y.oprname) over (partition by y.oid) as "conexclopnames"
--                           from y group by y.oid, y.conrelid, y.conname, y.attnum, y.attname, y.oprname)
--            select z.conexclopnames = e.oprnames is_ok
--                 , z.conname
--                 , z.attname
--                 , z.oprname
--                 , bitemporal.adjacency_operator_for(z.attname) as "expected_oprname"
--              from z
--             where z.conkey = e.conkey
--             order by 1 desc, z.oid, z.attnum
--     loop
--         if r.is_ok then
--             return;
--         end if;

--         if r.oprname <> r.expected_oprname then
--             message := format( '"%s": Invalid operator on attribute "%s". Expected: "%s", found: "%s"'
--                              , r.conname
--                              , r.attname
--                              , r.expected_oprname
--                              , r.oprname );
--             return next;
--         end if;
--     end loop;

--     if not found then
--         message := 'Missing exclude adjacency constraint';
--         return next;
--     end if;

--     return;
-- end; $body$;

-- create or replace function bitemporal.history_relation_errors
--     ( relid regclass )
-- returns table
--     ( namespace name
--     , relation  name
--     , message   text )
-- language plpgsql
-- immutable
-- as $body$
-- declare
--     p bitemporal.params;
--     hist_rel text;
--     hist_relid regclass;
--     r record;
-- begin
--     p := bitemporal.get_params();

--     select relnamespace::regnamespace
--          , relname
--       into namespace
--          , relation
--       from pg_class
--       where oid = relid;

--     hist_ns := bitemporal.history_namespace(relid);
--     hist_rel := bitemporal.history_relation_name(relid);
--     hist_relid := bitemporal.history_relation_id(relid);

--     if hist_relid is null then
--         message := format('Missing history relation "%s"', hist_rel);
--         return next;
--         return;
--     end if;


--     relation := hist_rel;

--     for r in select a.attname
--                   , a.atttypid
--                   , h.attname as "hist_attname"
--                   , h.atttypid as "hist_atttypid"
--                   , h.attname is null "is_missing_attribute"
--                   , h.atttypid is null or a.atttypid <> h.atttypid "is_type_mismatch"
--              from pg_attribute as "a"
--         left join pg_attribute as "h" on h.attrelid = hist_relid and h.attname = a.attname and not h.attisdropped
--             where a.attrelid = relid
--               and a.attnum > 0
--               and not a.attisdropped
--     loop
--         if r.is_missing_attribute then
--             message := format('Missing attribute "%s"', r.attname);
--             return next;
--         elsif r.is_type_mismatch then
--             message := format( 'Mismatched type on attribute "%s". Expected "%s", found "%s"'
--                              , r.attname
--                              , r.atttypid::regtype::text
--                              , r.hist_atttypid::regtype::text );
--             return next;
--         end if;
--     end loop;

--     return;
-- end $body$;



-- create or replace function bitemporal.system_time_errors
--     ( relid regclass )
-- returns table
--     ( namespace name
--     , relation  name
--     , attribute text
--     , message   text
--     , expected  text
--     , was       text )
-- language plpgsql
-- stable
-- as $body$
-- declare
--   p bitemporal.params;
--   r record;
-- begin
--     p := bitemporal.get_params();

--     attribute := p.system_time_name;

--     select relnamespace::regnamespace::text
--          , relname
--       into namespace
--          , relation
--       from pg_class
--      where oid = relid;

--     select atttypid::regtype as "atttypname"
--          , attnotnull
--       into r
--       from pg_attribute
--      where attrelid = relid
--        and attname = p.system_time_name
--        and not attisdropped;

--     if not found then
--        message := 'Missing attribute.';
--        return next;
--        return;
--     end if;

--     if not r.attnotnull then
--        message := 'Nullable attribute.';
--        return next;
--     end if;

--     if r.atttypname <> p.system_time_range then
--        message := 'Invalid type.';
--        expected := p.system_time_range::text;
--        was := r.atttypname;
--        return next;
--     end if;

--     return;
-- end $body$;

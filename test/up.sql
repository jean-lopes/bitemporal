\set QUIET 'on'

create extension btree_gist;

insert into bitemporal.configuration(valid_time_name, valid_time_type, system_time_name, system_time_type, system_time_current_time_fn)
values ('valid_period', 'integer', 'system_period', 'integer', '');

-- insert into bitemporal.foreign_keys(parent, parent_columns, child, child_columns)
-- values ('sample.s', '{id}', 'sample.sp', '{s_id}');





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

\set QUIET 'on'

create extension btree_gist;

insert into bitemporal.configuration(valid_time_name, valid_time_type, system_time_name, system_time_type, system_time_current_time_fn)
values ('valid_period', 'integer', 'system_period', 'integer', '');

-- insert into bitemporal.foreign_keys(parent, parent_columns, child, child_columns)
-- values ('sample.s', '{id}', 'sample.sp', '{s_id}');

select * from sample.s order by id, valid_period;
select * from sample_history.s order by id, valid_period;
/
call bitemporal.remove_s($$x.id = '1'$$, '[3, 3]');
/
truncate sample.s cascade;
truncate sample_history.s cascade;
/
create type bitemporal.range_type
    as enum ( 'integer'
            , 'bigint'
            , 'numeric'
            , 'timestamp'
            , 'timestamptz'
            , 'date' );

create or replace function bitemporal.get_range_type
    ( range_type bitemporal.range_type )
    returns text
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
           end;

create or replace function bitemporal.get_multirange_type
    ( range_type bitemporal.range_type )
    returns text
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
              end;
/
drop table bitemporal.params
/
create table bitemporal.params
    ( id                            boolean generated always as (true) stored unique --make this table accept only one row :)
    , valid_time_name               name
    , valid_time_type               bitemporal.range_type not null
    , system_time_name              name
    , system_time_type              bitemporal.range_type not null
    , system_time_current_time_fn   text not null
    , debug                         boolean not null );
/
insert into bitemporal.params(valid_time_name, valid_time_type, system_time_name, system_time_type, system_time_current_time_fn, debug)
values ('valid_period', 'integer', 'system_period', 'integer', '', false);
/
drop function bitemporal.bitemporal_tables
/
create or replace function bitemporal.bitemporal_tables
    ( schema_name name )
    returns table ( qualified_table_name regclass )
    language sql
    stable
    returns null on null input
    as $$select * from generate_series(1,10)$$;
/
select * from bitemporal.bitemporal_tables('public');

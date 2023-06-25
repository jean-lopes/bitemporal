\set QUIET 'on'

drop table if exists sample.ok;
drop table if exists sample.missing_valid_time;
drop table if exists sample.nullable_valid_time;
drop table if exists sample.valid_time_with_wrong_type;
drop table if exists sample.missing_system_time;
drop table if exists sample.nullable_system_time;
drop table if exists sample.system_time_with_wrong_type;
drop table if exists sample.missing_primary_key;

create or replace function bitemporal.check_table
    ( sch name
    , tbl name )
returns table
    ( error bitemporal.table_error )
language plpgsql
stable
as $body$
declare
    p   bitemporal.params;
    t   information_schema.tables;
    c   information_schema.columns;
    tc  information_schema.table_constraints;
    ccc information_schema.constraint_column_usage;
begin
    select *
      into p
      from bitemporal.params;

    if not found then
        raise exception 'empty table bitemporal.params';
    end if;

    select *
      into t
      from information_schema.tables
     where table_schema = sch
       and table_name = tbl;

    if not found then
        error := 'table-not-found';
        return next;
        return;
    end if;

    select *
      into c
      from information_schema.columns
     where table_schema = sch
       and table_name = tbl
       and column_name = p.valid_time_name;

    if not found then
        error := 'missing-valid-time';
        return next;
    end if;

    if found and c.is_nullable <> 'NO' then
        error := 'nullable-valid-time';
        return next;
    end if;

    if found and c.data_type <> bitemporal.get_range_type(p.valid_time_type) then
        error := 'wrong-valid-time-range-type';
        return next;
    end if;

    select *
      into c
      from information_schema.columns
     where table_schema = sch
       and table_name = tbl
       and column_name = p.system_time_name;

    if not found then
        error := 'missing-system-time';
        return next;
    end if;

    if found and c.is_nullable <> 'NO' then
        error := 'nullable-system-time';
        return next;
    end if;

    if found and c.data_type <> bitemporal.get_range_type(p.system_time_type) then
        error := 'wrong-system-time-range-type';
        return next;
    end if;

    select *
      into tc
      from information_schema.table_constraints
     where table_schema = sch
       and table_name = tbl
       and constraint_type = 'PRIMARY KEY';

    if not found then
        error := 'missing-primary-key';
        return next;
    end if;

    select *
      into ccc
      from information_schema.constraint_column_usage
     where table_catalog = t.table_catalog
       and table_schema = t.table_schema
       and table_name = t.table_name
       and column_name = p.valid_time_name
       and constraint_catalog = tc.constraint_catalog
       and constraint_schema = tc.constraint_schema
       and constraint_name = tc.constraint_name;

    if not found then
        error := 'missing-valid-time-on-primary-key';
        return next;
    end if;

    return;
end; $body$;

\echo 'check-table - [ok]'
create table sample.ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'ok');

\echo 'check-table - [missing valid time]'
create table sample.missing_valid_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , system_period     int4range not null
    , primary key(id, id2)
    , exclude using gist (id with =, id2 with =)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =) );

select * from bitemporal.check_table('sample', 'missing_valid_time');

\echo 'check-table - [nullable valid time]'
create table sample.nullable_valid_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range null
    , system_period     int4range not null
    , primary key(id, id2)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'nullable_valid_time');

\echo 'check-table - [valid time with wrong type]'
create table sample.valid_time_with_wrong_type
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int8range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'valid_time_with_wrong_type');

\echo 'check-table - [missing system time]'
create table sample.missing_system_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'missing_system_time');

\echo 'check-table - [nullable system time]'
create table sample.nullable_system_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'nullable_system_time');

\echo 'check-table - [system time with wrong type]'
create table sample.system_time_with_wrong_type
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int8range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'system_time_with_wrong_type');

\echo 'check-table - [missing primary key]'
create table sample.missing_primary_key
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'missing_primary_key');

\echo 'check-table - [primary key missing valid time]'
create table sample.primary_key_missing_valid_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.check_table('sample', 'primary_key_missing_valid_time');

\set QUIET 'on'

drop table if exists sample.ok;
drop table if exists sample.missing_valid_time;
drop table if exists sample.nullable_valid_time;
drop table if exists sample.valid_time_with_wrong_type;
drop table if exists sample.missing_system_time;
drop table if exists sample.nullable_system_time;
drop table if exists sample.system_time_with_wrong_type;
drop table if exists sample.missing_primary_key;

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

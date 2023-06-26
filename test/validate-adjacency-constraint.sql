\set QUIET 'on'

\echo 'bitemporal.validate_adjacency_constraint - [ok]'
drop table if exists sample.adjacency_constraint_ok;
create table sample.adjacency_constraint_ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_ok');

\echo 'bitemporal.validate_adjacency_constraint - [missing adjacency constraint]'
drop table if exists sample.adjacency_constraint_missing;
create table sample.adjacency_constraint_missing
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period));

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_missing');

\echo 'bitemporal.validate_adjacency_constraint - [mismatched fields]'
drop table if exists sample.adjacency_constraint_mismatched_fields;
create table sample.adjacency_constraint_mismatched_fields
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, system_period with =, valid_period with -|-) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_mismatched_fields');

\echo 'bitemporal.validate_adjacency_constraint - [mismatched fields]'
drop table if exists sample.adjacency_constraint_mismatched_fields_2;
create table sample.adjacency_constraint_mismatched_fields_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-, system_period with =) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_mismatched_fields_2');

\echo 'bitemporal.validate_adjacency_constraint - [wrong operator on common field]'
drop table if exists sample.adjacency_constraint_wrong_operator;
create table sample.adjacency_constraint_wrong_operator
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with <>, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_wrong_operator');

\echo 'bitemporal.validate_adjacency_constraint - [wrong operator on valid_time field]'
drop table if exists sample.adjacency_constraint_wrong_operator_2;
create table sample.adjacency_constraint_wrong_operator_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with &&) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_wrong_operator_2');

\echo 'bitemporal.validate_adjacency_constraint - [multiple wrong operators]'
drop table if exists sample.adjacency_constraint_wrong_operator_3;
create table sample.adjacency_constraint_wrong_operator_3
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with <>, id2 with <>, value with <>, value2 with <>, valid_period with &&) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_wrong_operator_3');

\echo 'bitemporal.validate_adjacency_constraint - [multiple constraints, one ok]'
drop table if exists sample.adjacency_constraint_multiple;
create table sample.adjacency_constraint_multiple
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with <>, id2 with =, value with =, value2 with <>, valid_period with &&)
    , exclude using gist (id with =, valid_period with -|-, id2 with =, value2 with =, value with =) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_multiple');

\echo 'bitemporal.validate_adjacency_constraint - [multiple constraints with primary key fields, none ok]'
drop table if exists sample.adjacency_constraint_multiple_2;
create table sample.adjacency_constraint_multiple_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with <>, id2 with =, value with =, value2 with <>, valid_period with &&)
    , exclude using gist (id with =, valid_period with -|-, id2 with <>, value2 with =, value with =) );

select * from bitemporal.validate_adjacency_constraint('sample.adjacency_constraint_multiple_2');

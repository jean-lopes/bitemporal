\set QUIET 'on'
\pset footer 'off'

drop schema if exists ac cascade;
create schema ac;

\echo 'bitemporal.adjacency_constraint_errors - [ok]'
\pset title 'ac.ok'
create table ac.ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.adjacency_constraint_errors('ac.ok');

\echo 'bitemporal.adjacency_constraint_errors - [missing adjacency constraint]'
\pset title 'ac.missing'
create table ac.missing
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period));

select * from bitemporal.adjacency_constraint_errors('ac.missing');

\echo 'bitemporal.adjacency_constraint_errors - [mismatched fields]'
\pset title 'ac.mismatched_fields'
create table ac.mismatched_fields
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, system_period with =, valid_period with -|-) );

select * from bitemporal.adjacency_constraint_errors('ac.mismatched_fields');

\echo 'bitemporal.adjacency_constraint_errors - [mismatched fields]'
\pset title 'ac.mismatched_fields_2'
create table ac.mismatched_fields_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, valid_period with -|-) );

select * from bitemporal.adjacency_constraint_errors('ac.mismatched_fields_2');

\echo 'bitemporal.adjacency_constraint_errors - [wrong operator on common field]'
\pset title 'ac.wrong_operator'
create table ac.wrong_operator
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with <>, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.adjacency_constraint_errors('ac.wrong_operator');

\echo 'bitemporal.adjacency_constraint_errors - [wrong operator on valid_time field]'
\pset title 'ac.wrong_operator_2'
create table ac.wrong_operator_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with &&) );

select * from bitemporal.adjacency_constraint_errors('ac.wrong_operator_2');

\echo 'bitemporal.adjacency_constraint_errors - [multiple wrong operators]'
\pset title 'ac.wrong_operator_3'
create table ac.wrong_operator_3
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with <>, id2 with <>, value with <>, value2 with <>, valid_period with &&) );

select * from bitemporal.adjacency_constraint_errors('ac.wrong_operator_3');

\echo 'bitemporal.adjacency_constraint_errors - [multiple constraints, one ok]'
\pset title 'ac.multiple_one_ok'
create table ac.multiple_one_ok
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

select * from bitemporal.adjacency_constraint_errors('ac.multiple_one_ok');

\echo 'bitemporal.adjacency_constraint_errors - [multiple constraints with primary key fields, none ok]'
\pset title 'ac.wrong_operator_none_ok'
create table ac.multiple_none_ok
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

select * from bitemporal.adjacency_constraint_errors('ac.multiple_none_ok');

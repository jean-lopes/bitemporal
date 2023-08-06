\set QUIET 'on'
\pset footer 'off'

drop schema if exists oc cascade;
create schema oc;

\echo 'bitemporal.overlap_constraint_errors - [ok]'
\pset title 'oc.ok'
create table oc.ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.ok');

\echo 'bitemporal.overlap_constraint_errors - [missing overlap constraint]'
\pset title 'oc.missing_constraint'
create table oc.missing_constraint
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.missing_constraint');

\echo 'bitemporal.overlap_constraint_errors - [primary key and exclude constraint mismatched fields]'
\pset title 'oc.pk_ex_mismatch_fields'
create table oc.pk_ex_mismatch_fields
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.pk_ex_mismatch_fields');

\echo 'bitemporal.overlap_constraint_errors - [primary key and exclude constraint mismatched fields]'
\pset title 'oc.pk_ex_mismatch_fields_2'
create table oc.pk_ex_mismatch_fields_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (value with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.pk_ex_mismatch_fields_2');

\echo 'bitemporal.overlap_constraint_errors - [wrong operator on common field]'
\pset title 'oc.wrong_operator'
create table oc.wrong_operator
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with <>, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.wrong_operator');

\echo 'bitemporal.overlap_constraint_errors - [wrong operator on valid_time field]'
\pset title 'oc.wrong_operator_2'
create table oc.wrong_operator_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with -|-)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.wrong_operator_2');

\echo 'bitemporal.overlap_constraint_errors - [multiple wrong operators]'
\pset title 'oc.wrong_operator_3'
create table oc.wrong_operator_3
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (valid_period with -|-, id2 with <>, id with <>)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.wrong_operator_3');

\echo 'bitemporal.overlap_constraint_errors - [multiple constraints with primary key fields, one ok]'
\pset title 'oc.multiple_one_ok'
create table oc.multiple_one_ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with -|-)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.multiple_one_ok');

\echo 'bitemporal.overlap_constraint_errors - [multiple constraints with primary key fields, none ok]'
\pset title 'oc.multiple_none_ok'
create table oc.multiple_none_ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with -|-)
    , exclude using gist (valid_period with -|-, id with =, id2 with =)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.overlap_constraint_errors('oc.multiple_none_ok');

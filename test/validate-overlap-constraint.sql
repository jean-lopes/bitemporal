\set QUIET 'on'

drop table if exists sample.overlap_constraint_ok;
drop table if exists sample.overlap_constraint_missing_constraint;
drop table if exists sample.pk_ex_different_fields;
drop table if exists sample.overlap_constraint_pk_ex_mismatch_fields;
drop table if exists sample.overlap_constraint_pk_ex_mismatch_fields_2;
drop table if exists sample.overlap_constraint_wrong_operator;
drop table if exists sample.overlap_constraint_wrong_operator_2;
drop table if exists sample.overlap_constraint_wrong_operator_3;

\echo 'bitemporal.validate_overlap_constraint - [ok]'
create table sample.overlap_constraint_ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_overlap_constraint('sample.overlap_constraint_ok');

\echo 'bitemporal.validate_overlap_constraint - [missing overlap constraint]'
create table sample.overlap_constraint_missing_constraint
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_overlap_constraint('sample.overlap_constraint_missing_constraint');

\echo 'bitemporal.validate_overlap_constraint - [primary key and exclude constraint mismatched fields]'
create table sample.overlap_constraint_pk_ex_mismatch_fields
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_overlap_constraint('sample.overlap_constraint_pk_ex_mismatch_fields');

\echo 'bitemporal.validate_overlap_constraint - [primary key and exclude constraint mismatched fields]'
create table sample.overlap_constraint_pk_ex_mismatch_fields_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (value with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_overlap_constraint('sample.overlap_constraint_pk_ex_mismatch_fields_2');

\echo 'bitemporal.validate_overlap_constraint - [wrong operator on common field]'
create table sample.overlap_constraint_wrong_operator
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with <>, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_overlap_constraint('sample.overlap_constraint_wrong_operator');

\echo 'bitemporal.validate_overlap_constraint - [wrong operator on valid_time field]'
create table sample.overlap_constraint_wrong_operator_2
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with -|-)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_overlap_constraint('sample.overlap_constraint_wrong_operator_2');

\echo 'bitemporal.validate_overlap_constraint - [multiple wrong operators]'
create table sample.overlap_constraint_wrong_operator_3
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with <>, id2 with <>, valid_period with -|-)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

select * from bitemporal.validate_overlap_constraint('sample.overlap_constraint_wrong_operator_3');

\set QUIET 'on'
\pset footer off

drop schema if exists vt cascade;
create schema vt;

\echo 'bitemporal.valid_time_errors - [ok]'
\pset title 'vt.ok'
create table vt.ok( valid_period int4range not null );
select * from bitemporal.valid_time_errors('vt.ok');

\echo 'bitemporal.valid_time_errors - [missing valid time]'
\pset title 'vt.missing'
create table vt.missing( id int );
select * from bitemporal.valid_time_errors('vt.missing');

\echo 'bitemporal.valid_time_errors - [nullable]'
\pset title 'vt.nullable'
create table vt.nullable( valid_period int4range );
select * from bitemporal.valid_time_errors('vt.nullable');

\echo 'bitemporal.valid_time_errors - [invalid type]'
\pset title 'vt.invalid_type'
create table vt.invalid_type( valid_period int not null );
select * from bitemporal.valid_time_errors('vt.invalid_type');

\echo 'bitemporal.valid_time_errors - [nullable invalid type]'
\pset title 'vt.nullable_invalid_type'
create table vt.nullable_invalid_type( valid_period int );
select * from bitemporal.valid_time_errors('vt.nullable_invalid_type');

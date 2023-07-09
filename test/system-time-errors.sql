\set QUIET 'on'
\pset footer off

drop schema if exists st cascade;
create schema st;

\echo 'bitemporal.system_time_errors - [ok]'
\pset title 'st.ok'
create table st.ok( system_period int4range not null );
select * from bitemporal.system_time_errors('st.ok');

\echo 'bitemporal.system_time_errors - [missing valid time]'
\pset title 'st.missing'
create table st.missing( id int );
select * from bitemporal.system_time_errors('st.missing');

\echo 'bitemporal.system_time_errors - [nullable]'
\pset title 'st.nullable'
create table st.nullable( system_period int4range );
select * from bitemporal.system_time_errors('st.nullable');

\echo 'bitemporal.system_time_errors - [invalid type]'
\pset title 'st.invalid_type'
create table st.invalid_type( system_period int not null );
select * from bitemporal.system_time_errors('st.invalid_type');

\echo 'bitemporal.system_time_errors - [nullable invalid type]'
\pset title 'st.nullable_invalid_type'
create table st.nullable_invalid_type( system_period int );
select * from bitemporal.system_time_errors('st.nullable_invalid_type');

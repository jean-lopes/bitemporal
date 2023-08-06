\set QUIET 'on'
\pset footer off

drop schema if exists pk cascade;
create schema pk;

\echo 'bitemporal.primary_key_errors - [ok]'
\pset title 'pk.ok'
create table pk.ok
    ( id           int not null
    , id2          int not null
    , valid_period int4range not null
    , primary key(id, id2, valid_period) );

select * from bitemporal.primary_key_errors('pk.ok');

\echo 'bitemporal.primary_key_errors - [missing primary key]'
\pset title 'pk.missing'
create table pk.missing
    ( id int not null );

select * from bitemporal.primary_key_errors('pk.missing');

\echo 'bitemporal.primary_key_errors - [missing valid time]'
\pset title 'pk.missing_valid_time'
create table pk.missing_valid_time
    ( id int not null
    , primary key(id) );

select * from bitemporal.primary_key_errors('pk.missing_valid_time');

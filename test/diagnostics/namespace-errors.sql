\set QUIET 'on'
\pset footer 'off'

drop schema if exists ne cascade;
drop schema if exists ne_history cascade;
create schema ne;
create schema ne_history;

\echo 'bitemporal.relation_errors'
create table ne.ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

create table ne_history.ok( like ne.ok );

create table ne.not_ok( id int );

select * from bitemporal.namespace_errors('ne');

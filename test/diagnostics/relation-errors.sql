\set QUIET 'on'
\pset footer 'off'

drop schema if exists re cascade;
drop schema if exists re_history cascade;
create schema re;
create schema re_history;

\echo 'bitemporal.relation_errors - [ok]'
\pset title 're.ok'
create table re.ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );
create table re_history.ok( like re.ok );
select * from bitemporal.relation_errors('re.ok');

\echo 'bitemporal.relation_errors - [not ok]'
\pset title 're.not_ok'
create table re.not_ok( id int );
select * from bitemporal.relation_errors('re.not_ok');

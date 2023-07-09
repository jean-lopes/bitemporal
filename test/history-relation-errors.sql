\set QUIET 'on'
\pset footer off

drop schema if exists h cascade;
drop schema if exists h_history cascade;
create schema h;
create schema h_history;

\echo 'bitemporal.history_relation_errors - [ok]'
\pset title 'h.ok'
create table h.ok( id int not null );
create table h_history.ok( like h.ok );
select * from bitemporal.history_relation_errors('h.ok');

\echo 'bitemporal.history_relation_errors - [missing relation]'
\pset title 'h.missing_relation'
create table h.missing_relation( id int not null );
select * from bitemporal.history_relation_errors('h.missing_relation');

\echo 'bitemporal.history_relation_errors - [missing attribute]'
\pset title 'h.missing_attribute'
create table h.missing_attribute( id int not null );
create table h_history.missing_attribute( idd int not null );
select * from bitemporal.history_relation_errors('h.missing_attribute');

\echo 'bitemporal.history_relation_errors - [wrong attribute type]'
\pset title 'h.wrong_attribute_type'
create table h.wrong_attribute_type( id int not null, value int );
create table h_history.wrong_attribute_type( id text not null, value text );
select * from bitemporal.history_relation_errors('h.wrong_attribute_type');

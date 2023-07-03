\set QUIET 'on'

drop schema if exists hre_ok cascade;
drop schema if exists hre_ok_hist cascade;
drop schema if exists hre_missing_relations cascade;
drop schema if exists hre_missing_relations_hist cascade;
drop schema if exists hre_missing_attribute cascade;
drop schema if exists hre_missing_attribute_hist cascade;
drop schema if exists hre_wrong_attribute_type cascade;
drop schema if exists hre_wrong_attribute_type_hist cascade;
create schema hre_ok;
create schema hre_ok_hist;
create schema hre_missing_relations;
create schema hre_missing_relations_hist;
create schema hre_missing_attribute;
create schema hre_missing_attribute_hist;
create schema hre_wrong_attribute_type;
create schema hre_wrong_attribute_type_hist;

\echo 'bitemporal.history_relation_errors - [ok]'
create table hre_ok.rel( id int not null );
create table hre_ok_hist.rel( like hre_ok.rel );
select * from bitemporal.history_relation_errors('hre_ok', 'hre_ok_hist');

\echo 'bitemporal.history_relation_errors - [missing tables]'
create table hre_missing_relations.rel1( id int not null );
create table hre_missing_relations.rel2( id int not null );
create table hre_missing_relations.rel3( id int not null );
create table hre_missing_relations_hist.rel1( like hre_missing_relations.rel1 );
select * from bitemporal.history_relation_errors('hre_missing_relations', 'hre_missing_relations_hist');

\echo 'bitemporal.history_relation_errors - [missing attribute]'
create table hre_missing_attribute.rel( id int not null );
create table hre_missing_attribute_hist.rel( idd int not null );
select * from bitemporal.history_relation_errors('hre_missing_attribute', 'hre_missing_attribute_hist');

\echo 'bitemporal.history_relation_errors - [wrong attribute type]'
create table hre_wrong_attribute_type.rel( id int not null );
create table hre_wrong_attribute_type_hist.rel( id text not null );
select * from bitemporal.history_relation_errors('hre_wrong_attribute_type', 'hre_wrong_attribute_type_hist');

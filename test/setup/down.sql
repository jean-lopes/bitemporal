\set QUIET 'on'
drop schema if exists pk cascade;
drop schema if exists vt cascade;
drop schema if exists hre_ok cascade;
drop schema if exists hre_ok_hist cascade;
drop schema if exists hre_missing_relations cascade;
drop schema if exists hre_missing_relations_hist cascade;
drop schema if exists hre_missing_attribute cascade;
drop schema if exists hre_missing_attribute_hist cascade;
drop schema if exists hre_wrong_attribute_type cascade;
drop schema if exists hre_wrong_attribute_type_hist cascade;
drop schema if exists sample_history cascade;
drop schema if exists sample cascade;
drop schema if exists bitemporal cascade;
drop extension if exists btree_gist cascade;

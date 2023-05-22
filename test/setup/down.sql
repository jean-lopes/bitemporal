\set QUIET 'on'
drop schema if exists bitemporal cascade;
drop table if exists sp cascade;
drop table if exists s cascade;
drop extension if exists btree_gist cascade;

\set QUIET 'on'
drop schema if exists sample_history cascade;
drop schema if exists sample cascade;
drop schema if exists bitemporal cascade;
drop extension if exists btree_gist cascade;

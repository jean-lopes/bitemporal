\set QUIET 'on'
drop schema if exists pk cascade;
drop schema if exists vt cascade;
drop schema if exists st cascade;
drop schema if exists h cascade;
drop schema if exists h_history cascade;
drop schema if exists sample_history cascade;
drop schema if exists sample cascade;
drop schema if exists bitemporal cascade;
drop extension if exists btree_gist cascade;

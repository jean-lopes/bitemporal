\set QUIET 'on'
drop schema if exists bitemporal cascade;
-- drop procedure if exists remove_cascade_sp(text, sp.valid_period%type) cascade;
-- drop procedure if exists remove_cascade_s(text, s.valid_period%type) cascade;
-- drop procedure if exists remove_sp(text, sp.valid_period%type) cascade;
-- drop procedure if exists remove_s(text, s.valid_period%type) cascade;
-- drop procedure if exists save_sp(sp.s_id%type, sp.id%type, sp.state%type, sp.valid_period%type) cascade;
-- drop procedure if exists save_s(s.id%type, s.value%type, s.valid_period%type) cascade;
-- drop function if exists check_fk_s_sp cascade;
drop table if exists sp cascade;
drop table if exists s cascade;
drop extension if exists btree_gist cascade;

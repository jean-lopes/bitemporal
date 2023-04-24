\set QUIET 'on'

drop procedure if exists remove_s(text, s.valid_period%type) cascade;
drop procedure if exists save_s(s.id%type, s.value%type, s.valid_period%type) cascade;
drop table if exists s_history cascade;
drop table if exists s cascade;
drop extension if exists btree_gist cascade;

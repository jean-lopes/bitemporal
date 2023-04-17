\set QUIET 'on'

-- used for test generation
drop table if exists relationships cascade;

-- test oracle
drop procedure if exists oracle_remove_s(text,s.valid_period%type) cascade;
drop procedure if exists oracle_save_s(s.id%type) cascade;
drop procedure if exists unpack(s.id%type) cascade;
drop procedure if exists pack(s.id%type) cascade;
drop table if exists unpacked cascade;
drop table if exists packed cascade;

-- code under test
drop procedure if exists save_s(s.id%type, s.value%type, s.valid_period%type) cascade;
drop function if exists last_tx_time cascade;
drop table if exists s_history cascade;
drop table if exists s cascade;
drop extension if exists btree_gist cascade;

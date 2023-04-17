\set QUIET 'on'

delete from s where id like 'connectedness-%';

\echo 'connectedness-01 - [uuuu]'
insert into s(id, value, valid_period) values ('connectedness-01', 0, '[,)');
call save_s('connectedness-01', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-01' order by valid_period;

\echo 'connectedness-02 - [uuub]'
insert into s(id, value, valid_period) values ('connectedness-02', 0, '[,)');
call save_s('connectedness-02', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-02' order by valid_period;

\echo 'connectedness-03 - [uubu]'
insert into s(id, value, valid_period) values ('connectedness-03', 0, '[,)');
call save_s('connectedness-03', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-03' order by valid_period;

\echo 'connectedness-04 - [uubb]'
insert into s(id, value, valid_period) values ('connectedness-04', 0, '[,)');
call save_s('connectedness-04', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-04' order by valid_period;

\echo 'connectedness-05 - [ubuu]'
insert into s(id, value, valid_period) values ('connectedness-05', 0, '[,80)');
call save_s('connectedness-05', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-05' order by valid_period;

\echo 'connectedness-06 - [ubub]'
insert into s(id, value, valid_period) values ('connectedness-06', 0, '[,80)');
call save_s('connectedness-06', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-06' order by valid_period;

\echo 'connectedness-07 - [ubbu]'
insert into s(id, value, valid_period) values ('connectedness-07', 0, '[,80)');
call save_s('connectedness-07', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-07' order by valid_period;

\echo 'connectedness-08 - [ubbb]'
insert into s(id, value, valid_period) values ('connectedness-08', 0, '[,80)');
call save_s('connectedness-08', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-08' order by valid_period;

\echo 'connectedness-09 - [buuu]'
insert into s(id, value, valid_period) values ('connectedness-09', 0, '[0,)');
call save_s('connectedness-09', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-09' order by valid_period;

\echo 'connectedness-10 - [buub]'
insert into s(id, value, valid_period) values ('connectedness-10', 0, '[0,)');
call save_s('connectedness-10', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-10' order by valid_period;

\echo 'connectedness-11 - [bubu]'
insert into s(id, value, valid_period) values ('connectedness-11', 0, '[0,)');
call save_s('connectedness-11', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-11' order by valid_period;

\echo 'connectedness-12 - [bubb]'
insert into s(id, value, valid_period) values ('connectedness-12', 0, '[0,)');
call save_s('connectedness-12', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-12' order by valid_period;

\echo 'connectedness-13 - [bbuu]'
insert into s(id, value, valid_period) values ('connectedness-13', 0, '[0,80)');
call save_s('connectedness-13', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-13' order by valid_period;

\echo 'connectedness-14 - [bbub]'
insert into s(id, value, valid_period) values ('connectedness-14', 0, '[0,80)');
call save_s('connectedness-14', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-14' order by valid_period;

\echo 'connectedness-15 - [bbbu]'
insert into s(id, value, valid_period) values ('connectedness-15', 0, '[0,80)');
call save_s('connectedness-15', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-15' order by valid_period;

\echo 'connectedness-16 - [bbbb]'
insert into s(id, value, valid_period) values ('connectedness-16', 0, '[0,80)');
call save_s('connectedness-16', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-16' order by valid_period;

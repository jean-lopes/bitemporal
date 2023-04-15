\set QUIET 'on'

delete from s where id like 'connectedness-%';

\echo 'connectedness-01 - [unbounded, unbounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-01', 0, '[,)');
call save_s('connectedness-01', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-01' order by valid_period;

\echo 'connectedness-02 - [unbounded, unbounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-02', 0, '[,)');
call save_s('connectedness-02', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-02' order by valid_period;

\echo 'connectedness-03 - [unbounded, unbounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-03', 0, '[,)');
call save_s('connectedness-03', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-03' order by valid_period;

\echo 'connectedness-04 - [unbounded, unbounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-04', 0, '[,)');
call save_s('connectedness-04', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-04' order by valid_period;

\echo 'connectedness-05 - [unbounded,   bounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-05', 0, '[,80)');
call save_s('connectedness-05', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-05' order by valid_period;

\echo 'connectedness-06 - [unbounded,   bounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-06', 0, '[,80)');
call save_s('connectedness-06', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-06' order by valid_period;

\echo 'connectedness-07 - [unbounded,   bounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-07', 0, '[,80)');
call save_s('connectedness-07', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-07' order by valid_period;

\echo 'connectedness-08 - [unbounded,   bounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-08', 0, '[,80)');
call save_s('connectedness-08', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-08' order by valid_period;

\echo 'connectedness-09 - [  bounded, unbounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-09', 0, '[0,)');
call save_s('connectedness-09', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-09' order by valid_period;

\echo 'connectedness-10 - [  bounded, unbounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-10', 0, '[0,)');
call save_s('connectedness-10', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-10' order by valid_period;

\echo 'connectedness-11 - [  bounded, unbounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-11', 0, '[0,)');
call save_s('connectedness-11', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-11' order by valid_period;

\echo 'connectedness-12 - [  bounded, unbounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-12', 0, '[0,)');
call save_s('connectedness-12', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-12' order by valid_period;

\echo 'connectedness-13 - [  bounded,   bounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-13', 0, '[0,80)');
call save_s('connectedness-13', 0, '[,)');
select id, value, valid_period from s where id = 'connectedness-13' order by valid_period;

\echo 'connectedness-14 - [  bounded,   bounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-14', 0, '[0,80)');
call save_s('connectedness-14', 0, '[,55)');
select id, value, valid_period from s where id = 'connectedness-14' order by valid_period;

\echo 'connectedness-15 - [  bounded,   bounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('connectedness-15', 0, '[0,80)');
call save_s('connectedness-15', 0, '[25,)');
select id, value, valid_period from s where id = 'connectedness-15' order by valid_period;

\echo 'connectedness-16 - [  bounded,   bounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('connectedness-16', 0, '[0,80)');
call save_s('connectedness-16', 0, '[25,55)');
select id, value, valid_period from s where id = 'connectedness-16' order by valid_period;

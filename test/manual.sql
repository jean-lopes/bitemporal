\set QUIET 'on'

delete from s where id like 'manual-%';

-- \echo 'manual-01 - [adjacent]'
-- insert into s(id, value, valid_period) values ('manual-01', 1, '[20,25)');
-- insert into s(id, value, valid_period) values ('manual-01', 1, '[55,60)');
-- call save_s('manual-01', 0, '[25, 55)');
-- select * from s where id = 'manual-01' order by valid_period;

-- \echo 'manual-02 - [connected]'
-- insert into s(id, value, valid_period) values ('manual-02', 0, '[20,25)');
-- insert into s(id, value, valid_period) values ('manual-02', 0, '[55,60)');
-- call save_s('manual-02', 0, '[25, 55)');
-- select * from s where id = 'manual-02' order by valid_period;

-- \echo 'manual-03 - [empty]'
-- insert into s(id, value, valid_period) values ('manual-03', 1, '[0,5)');
-- call save_s('manual-03', 0, 'empty');

\echo 'manual-04 - [unbounded, unbounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-04', 1, '[,)');
call save_s('manual-04', 0, '[,)');
select id, value, valid_period from s where id = 'manual-04' order by valid_period;

\echo 'manual-05 - [unbounded, unbounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-05', 1, '[,)');
call save_s('manual-05', 0, '[,55)');
select id, value, valid_period from s where id = 'manual-05' order by valid_period;

\echo 'manual-06 - [unbounded, unbounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-06', 1, '[,)');
call save_s('manual-06', 0, '[25,)');
select id, value, valid_period from s where id = 'manual-06' order by valid_period;

\echo 'manual-07 - [unbounded, unbounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-07', 1, '[,)');
call save_s('manual-07', 0, '[25,55)');
select id, value, valid_period from s where id = 'manual-07' order by valid_period;

\echo 'manual-08 - [unbounded,   bounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-08', 1, '[,80)');
call save_s('manual-08', 0, '[,)');
select id, value, valid_period from s where id = 'manual-08' order by valid_period;

\echo 'manual-09 - [unbounded,   bounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-09', 1, '[,80)');
call save_s('manual-09', 0, '[,55)');
select id, value, valid_period from s where id = 'manual-09' order by valid_period;

\echo 'manual-10 - [unbounded,   bounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-10', 1, '[,80)');
call save_s('manual-10', 0, '[25,)');
select id, value, valid_period from s where id = 'manual-10' order by valid_period;

\echo 'manual-11 - [unbounded,   bounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-11', 1, '[,80)');
call save_s('manual-11', 0, '[25,55)');
select id, value, valid_period from s where id = 'manual-11' order by valid_period;

\echo 'manual-12 - [  bounded, unbounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-12', 1, '[0,)');
call save_s('manual-12', 0, '[,)');
select id, value, valid_period from s where id = 'manual-12' order by valid_period;

\echo 'manual-13 - [  bounded, unbounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-13', 1, '[0,)');
call save_s('manual-13', 0, '[,55)');
select id, value, valid_period from s where id = 'manual-13' order by valid_period;

\echo 'manual-14 - [  bounded, unbounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-14', 1, '[0,)');
call save_s('manual-14', 0, '[25,)');
select id, value, valid_period from s where id = 'manual-14' order by valid_period;
--
\echo 'manual-15 - [  bounded, unbounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-15', 1, '[0,)');
call save_s('manual-15', 0, '[25,55)');
select id, value, valid_period from s where id = 'manual-15' order by valid_period;
--
\echo 'manual-16 - [  bounded,   bounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-16', 1, '[0,80)');
call save_s('manual-16', 0, '[,)');
select id, value, valid_period from s where id = 'manual-16' order by valid_period;

\echo 'manual-17 - [  bounded,   bounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-17', 1, '[0,80)');
call save_s('manual-17', 0, '[,55)');
select id, value, valid_period from s where id = 'manual-17' order by valid_period;

\echo 'manual-18 - [  bounded,   bounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('manual-18', 1, '[0,80)');
call save_s('manual-18', 0, '[25,)');
select id, value, valid_period from s where id = 'manual-18' order by valid_period;

\echo 'manual-19 - [  bounded,   bounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('manual-19', 1, '[0,80)');
call save_s('manual-19', 0, '[25,55)');
select id, value, valid_period from s where id = 'manual-19' order by valid_period;

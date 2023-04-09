\set QUIET 'on'

delete from s where id like 'adjacency-%';

\echo 'adjacency-01 - [unbounded, unbounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-01', 1, '[,)');
call save_s('adjacency-01', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-01' order by valid_period;

\echo 'adjacency-02 - [unbounded, unbounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-02', 1, '[,)');
call save_s('adjacency-02', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-02' order by valid_period;

\echo 'adjacency-03 - [unbounded, unbounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-03', 1, '[,)');
call save_s('adjacency-03', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-03' order by valid_period;

\echo 'adjacency-04 - [unbounded, unbounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-04', 1, '[,)');
call save_s('adjacency-04', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-04' order by valid_period;

\echo 'adjacency-05 - [unbounded,   bounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-05', 1, '[,80)');
call save_s('adjacency-05', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-05' order by valid_period;

\echo 'adjacency-06 - [unbounded,   bounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-06', 1, '[,80)');
call save_s('adjacency-06', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-06' order by valid_period;

\echo 'adjacency-07 - [unbounded,   bounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-07', 1, '[,80)');
call save_s('adjacency-07', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-07' order by valid_period;

\echo 'adjacency-08 - [unbounded,   bounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-08', 1, '[,80)');
call save_s('adjacency-08', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-08' order by valid_period;

\echo 'adjacency-09 - [  bounded, unbounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-09', 1, '[0,)');
call save_s('adjacency-09', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-09' order by valid_period;

\echo 'adjacency-10 - [  bounded, unbounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-10', 1, '[0,)');
call save_s('adjacency-10', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-10' order by valid_period;

\echo 'adjacency-11 - [  bounded, unbounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-11', 1, '[0,)');
call save_s('adjacency-11', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-11' order by valid_period;
--
\echo 'adjacency-12 - [  bounded, unbounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-12', 1, '[0,)');
call save_s('adjacency-12', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-12' order by valid_period;
--
\echo 'adjacency-13 - [  bounded,   bounded, unbounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-13', 1, '[0,80)');
call save_s('adjacency-13', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-13' order by valid_period;

\echo 'adjacency-14 - [  bounded,   bounded, unbounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-14', 1, '[0,80)');
call save_s('adjacency-14', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-14' order by valid_period;

\echo 'adjacency-15 - [  bounded,   bounded,   bounded, unbounded]'
insert into s(id, value, valid_period) values ('adjacency-15', 1, '[0,80)');
call save_s('adjacency-15', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-15' order by valid_period;

\echo 'adjacency-16 - [  bounded,   bounded,   bounded,   bounded]'
insert into s(id, value, valid_period) values ('adjacency-16', 1, '[0,80)');
call save_s('adjacency-16', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-16' order by valid_period;

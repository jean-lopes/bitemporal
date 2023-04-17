\set QUIET 'on'

delete from s where id like 'adjacency-%';

\echo 'adjacency-01 - [uuuu]'
insert into s(id, value, valid_period) values ('adjacency-01', 1, '[,)');
call save_s('adjacency-01', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-01' order by valid_period;

\echo 'adjacency-02 - [uuub]'
insert into s(id, value, valid_period) values ('adjacency-02', 1, '[,)');
call save_s('adjacency-02', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-02' order by valid_period;

\echo 'adjacency-03 - [uubu]'
insert into s(id, value, valid_period) values ('adjacency-03', 1, '[,)');
call save_s('adjacency-03', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-03' order by valid_period;

\echo 'adjacency-04 - [uubb]'
insert into s(id, value, valid_period) values ('adjacency-04', 1, '[,)');
call save_s('adjacency-04', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-04' order by valid_period;

\echo 'adjacency-05 - [ubuu]'
insert into s(id, value, valid_period) values ('adjacency-05', 1, '[,80)');
call save_s('adjacency-05', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-05' order by valid_period;

\echo 'adjacency-06 - [ubub]'
insert into s(id, value, valid_period) values ('adjacency-06', 1, '[,80)');
call save_s('adjacency-06', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-06' order by valid_period;

\echo 'adjacency-07 - [ubbu]'
insert into s(id, value, valid_period) values ('adjacency-07', 1, '[,80)');
call save_s('adjacency-07', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-07' order by valid_period;

\echo 'adjacency-08 - [ubbb]'
insert into s(id, value, valid_period) values ('adjacency-08', 1, '[,80)');
call save_s('adjacency-08', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-08' order by valid_period;

\echo 'adjacency-09 - [buuu]'
insert into s(id, value, valid_period) values ('adjacency-09', 1, '[0,)');
call save_s('adjacency-09', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-09' order by valid_period;

\echo 'adjacency-10 - [buub]'
insert into s(id, value, valid_period) values ('adjacency-10', 1, '[0,)');
call save_s('adjacency-10', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-10' order by valid_period;

\echo 'adjacency-11 - [bubu]'
insert into s(id, value, valid_period) values ('adjacency-11', 1, '[0,)');
call save_s('adjacency-11', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-11' order by valid_period;
--
\echo 'adjacency-12 - [bubb]'
insert into s(id, value, valid_period) values ('adjacency-12', 1, '[0,)');
call save_s('adjacency-12', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-12' order by valid_period;
--
\echo 'adjacency-13 - [bbuu]'
insert into s(id, value, valid_period) values ('adjacency-13', 1, '[0,80)');
call save_s('adjacency-13', 0, '[,)');
select id, value, valid_period from s where id = 'adjacency-13' order by valid_period;

\echo 'adjacency-14 - [bbub]'
insert into s(id, value, valid_period) values ('adjacency-14', 1, '[0,80)');
call save_s('adjacency-14', 0, '[,55)');
select id, value, valid_period from s where id = 'adjacency-14' order by valid_period;

\echo 'adjacency-15 - [bbbu]'
insert into s(id, value, valid_period) values ('adjacency-15', 1, '[0,80)');
call save_s('adjacency-15', 0, '[25,)');
select id, value, valid_period from s where id = 'adjacency-15' order by valid_period;

\echo 'adjacency-16 - [bbbb]'
insert into s(id, value, valid_period) values ('adjacency-16', 1, '[0,80)');
call save_s('adjacency-16', 0, '[25,55)');
select id, value, valid_period from s where id = 'adjacency-16' order by valid_period;

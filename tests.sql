\set QUIET 'on'
--\out 'test.out'

truncate s;

\echo 'test 001'
call save_s(1, 0, '[0,)'::int4range);
select id, value, valid_period from s where id = 1 order by valid_period;

\echo 'test 002'
insert into s(id, value, valid_period)
values (2, 0, '[0,)'); --overlapped
call save_s(2, 2, '[0,5)'::int4range);
select id, value, valid_period from s where id = 2 order by valid_period;

\echo 'test 003'
insert into s(id, value, valid_period)
values (3, 0, '[0,5)'); --connected
call save_s(3, 0, '[5,10)'::int4range);
select id, value, valid_period from s where id = 3 order by valid_period;

\echo 'test 004'
insert into s(id, value, valid_period)
values (99, 0, '[0,5)'); --adjancent
call save_s(99, 1, '[5,10)'::int4range);
select id, value, valid_period from s where id = 99 order by valid_period;

\echo 'test 004'
insert into s(id, value, valid_period)
values (4, 0, '[0,5)'); --disconnected
call save_s(4, 0, '[10,15)');
select id, value, valid_period from s where id = 4 order by valid_period;

\echo 'test 005'
insert into s(id, value, valid_period)
values (5,  5, '[0, 5)')   --overlapped
     , (5, 10, '[5,10)'); --overlapped
call save_s(5, 0, '[3,8)');
select id, value, valid_period from s where id = 5 order by valid_period;

\echo 'test 006'
insert into s(id, value, valid_period)
values (6,  5, '[0, 5)')   --overlapped
     , (6, 10, '[8,10)'); --connected
call save_s(6, 10, '[3,8)');
select id, value, valid_period from s where id = 6 order by valid_period;

\echo 'test 007'
insert into s(id, value, valid_period)
values (7,  5, '[ 0, 5)')  --overlapped
     , (7, 10, '[10,15)'); --disconnected
call save_s(7, 0, '[3,8)');
select id, value, valid_period from s where id = 7 order by valid_period;

\echo 'test 008'
insert into s(id, value, valid_period)
values (8,  5, '[0, 5)')  --connected
     , (8, 10, '[5,10)'); --overlapped
call save_s(8, 5, '[5,8)');
select id, value, valid_period from s where id = 8 order by valid_period;

\echo 'test 009'
insert into s(id, value, valid_period)
values (9, 0, '[0, 5)')  --connected
     , (9, 0, '[10,15)'); --connected
call save_s(9, 0, '[5,10)');
select id, value, valid_period from s where id = 9 order by valid_period;

\echo 'test 010'
insert into s(id, value, valid_period)
values (10,  5, '[ 0, 5)')  --connected
     , (10, 10, '[10,15)'); --disconnected
call save_s(10, 5, '[5,8)');
select id, value, valid_period from s where id = 10 order by valid_period;

\echo 'test 011'
insert into s(id, value, valid_period) values (11, 5, '[0,5)'); --disconnected
insert into s(id, value, valid_period) values (11, 10, '[5,10)'); --overlapped
call save_s(11, 0, '[3,8)');
select id, value, valid_period from s where id = 11 order by valid_period;

\echo 'test 012'
insert into s(id, value, valid_period) values (12, 5, '[0,5)'); --disconnected
insert into s(id, value, valid_period) values (12, 10, '[5,10)'); --connected
call save_s(12, 0, '[3,8)');
select id, value, valid_period from s where id = 12 order by valid_period;

\echo 'test 013'
insert into s(id, value, valid_period) values (13, 5, '[0,5)'); --disconnected
insert into s(id, value, valid_period) values (13, 10, '[5,10)'); --disconnected
call save_s(13, 0, '[3,8)');
select id, value, valid_period from s where id = 13 order by valid_period;

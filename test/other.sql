\set QUIET 'on'

delete from s where id like 'other-%';

\echo 'other-01 - [empty]'
insert into s(id, value, valid_period) values ('other-01', 1, '[0,5)');
call save_s('other-01', 0, 'empty');

\set QUIET 'on'

truncate sample.sp cascade;
truncate sample.s cascade;

\echo 'remove-with-foreign-key-000'
call sample.save_s('s-for-fk-000', 1, '[3,6]');
call sample.save_sp('s-for-fk-000', 'remove-with-foreign-key-000', 0, '[3,6]');
call sample.remove_s($$x.id = 's-for-fk-000'$$, '[3,6]');
select id, value, valid_period from sample.s where id = 's-for-fk-000' order by valid_period;
select s_id, id, state, valid_period from sample.sp where id = 'remove-with-foreign-key-000' order by valid_period;

\echo 'remove-with-foreign-key-001'
call sample.save_s('s-for-fk-001', 1, '[3,6]');
call sample.save_sp('s-for-fk-001', 'remove-with-foreign-key-001', 0, '[3,6]');
call sample.remove_cascade_s($$x.id = 's-for-fk-001'$$, '[3,6]');
select id, value, valid_period from sample.s where id = 's-for-fk-001' order by valid_period;
select s_id, id, state, valid_period from sample.sp where id = 'remove-with-foreign-key-001' order by valid_period;

\echo 'remove-with-foreign-key-002'
call sample.save_s('s-for-fk-002', 1, '[2,3]');
call sample.save_s('s-for-fk-002', 2, '[4,5]');
call sample.save_s('s-for-fk-002', 3, '[6,7]');
call sample.save_sp('s-for-fk-002', 'remove-with-foreign-key-002', 0, '[2,7]');
call sample.remove_s($$x.id = 's-for-fk-002'$$, '[4,5]');
select id, value, valid_period from sample.s where id = 's-for-fk-002' order by valid_period;
select s_id, id, state, valid_period from sample.sp where id = 'remove-with-foreign-key-002' order by valid_period;

\echo 'remove-with-foreign-key-003'
call sample.save_s('s-for-fk-003', 1, '[2,3]');
call sample.save_s('s-for-fk-003', 2, '[4,5]');
call sample.save_s('s-for-fk-003', 3, '[6,7]');
call sample.save_sp('s-for-fk-003', 'remove-with-foreign-key-003', 0, '[2,7]');
call sample.remove_cascade_s($$x.id = 's-for-fk-003'$$, '[4,5]');
select id, value, valid_period from sample.s where id = 's-for-fk-003' order by valid_period;
select s_id, id, state, valid_period from sample.sp where id = 'remove-with-foreign-key-003' order by valid_period;

\echo 'TODO: 3 node foreign key s->sp->spc'

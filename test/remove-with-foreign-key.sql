\set QUIET 'on'

truncate sp cascade;
truncate s cascade;

\echo 'remove-with-foreign-key-000'
call bitemporal.save_s('s-for-fk-000', 1, '[3,6]');
call bitemporal.save_sp('s-for-fk-000', 'remove-with-foreign-key-000', 0, '[3,6]');
call bitemporal.remove_s($$x.id = 's-for-fk-000'$$, '[3,6]');
select id, value, valid_period from s where id = 's-for-fk-000' order by valid_period;
select s_id, id, state, valid_period from sp where id = 'remove-with-foreign-key-000' order by valid_period;

\echo 'remove-with-foreign-key-001'
call bitemporal.save_s('s-for-fk-001', 1, '[3,6]');
call bitemporal.save_sp('s-for-fk-001', 'remove-with-foreign-key-001', 0, '[3,6]');
call bitemporal.remove_cascade_s($$x.id = 's-for-fk-001'$$, '[3,6]');
select id, value, valid_period from s where id = 's-for-fk-001' order by valid_period;
select s_id, id, state, valid_period from sp where id = 'remove-with-foreign-key-001' order by valid_period;

\echo 'remove-with-foreign-key-002'
call bitemporal.save_s('s-for-fk-002', 1, '[2,3]');
call bitemporal.save_s('s-for-fk-002', 2, '[4,5]');
call bitemporal.save_s('s-for-fk-002', 3, '[6,7]');
call bitemporal.save_sp('s-for-fk-002', 'remove-with-foreign-key-002', 0, '[2,7]');
call bitemporal.remove_s($$x.id = 's-for-fk-002'$$, '[4,5]');
select id, value, valid_period from s where id = 's-for-fk-002' order by valid_period;
select s_id, id, state, valid_period from sp where id = 'remove-with-foreign-key-002' order by valid_period;

\echo 'remove-with-foreign-key-003'
call bitemporal.save_s('s-for-fk-003', 1, '[2,3]');
call bitemporal.save_s('s-for-fk-003', 2, '[4,5]');
call bitemporal.save_s('s-for-fk-003', 3, '[6,7]');
call bitemporal.save_sp('s-for-fk-003', 'remove-with-foreign-key-003', 0, '[2,7]');
call bitemporal.remove_cascade_s($$x.id = 's-for-fk-003'$$, '[4,5]');
select id, value, valid_period from s where id = 's-for-fk-003' order by valid_period;
select s_id, id, state, valid_period from sp where id = 'remove-with-foreign-key-003' order by valid_period;

\echo 'TODO: 3 node foreign key s->sp->spc'

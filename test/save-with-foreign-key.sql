\set QUIET 'on'

truncate sample.sp cascade;
truncate sample.s cascade;

insert into sample.s(id, value, valid_period) values('s-for-fk-1', 1, '[3,6]');

insert into sample.s(id, value, valid_period) values('s-for-fk-2', 1, '[3,4]');
insert into sample.s(id, value, valid_period) values('s-for-fk-2', 2, '[5,6]');

insert into sample.s(id, value, valid_period) values('s-for-fk-3', 1, '[2,3]');
insert into sample.s(id, value, valid_period) values('s-for-fk-3', 2, '[6,7]');

insert into sample.s(id, value, valid_period) values('s-for-fk-4', 1, '[3,)');

insert into sample.s(id, value, valid_period) values('s-for-fk-5', 1, '(,6]');

insert into sample.s(id, value, valid_period) values('s-for-fk-6', 1, '(,)');

\echo 'save-with-foreign-key-000 - [empty]'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-000', 0, 'empty');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-000' order by valid_period;

\echo 'save-with-foreign-key-001'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-001', 1, '[3,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-001' order by valid_period;

\echo 'save-with-foreign-key-002'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-002', 1, '[0,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-002' order by valid_period;

\echo 'save-with-foreign-key-003'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-003', 1, '[0,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-003' order by valid_period;

\echo 'save-with-foreign-key-004'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-004', 1, '[6,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-004' order by valid_period;

\echo 'save-with-foreign-key-005'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-005', 1, '[0,1]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-005' order by valid_period;

\echo 'save-with-foreign-key-006'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-006', 1, '[8,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-006' order by valid_period;

\echo 'save-with-foreign-key-007'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-007', 1, '(,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-007' order by valid_period;

\echo 'save-with-foreign-key-008'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-008', 1, '(,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-008' order by valid_period;

\echo 'save-with-foreign-key-009'
call sample.save_sp('s-for-fk-1', 'save-with-foreign-key-009', 1, '[6,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-009' order by valid_period;

\echo 'save-with-foreign-key-010'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-010', 1, '[3,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-010' order by valid_period;

\echo 'save-with-foreign-key-011'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-011', 1, '[0,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-011' order by valid_period;

\echo 'save-with-foreign-key-012'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-012', 1, '[0,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-012' order by valid_period;

\echo 'save-with-foreign-key-013'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-013', 1, '[6,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-013' order by valid_period;

\echo 'save-with-foreign-key-014'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-014', 1, '[0,1]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-014' order by valid_period;

\echo 'save-with-foreign-key-015'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-015', 1, '[8,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-015' order by valid_period;

\echo 'save-with-foreign-key-016'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-016', 1, '(,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-016' order by valid_period;

\echo 'save-with-foreign-key-017'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-017', 1, '(,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-017' order by valid_period;

\echo 'save-with-foreign-key-018'
call sample.save_sp('s-for-fk-2', 'save-with-foreign-key-018', 1, '[6,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-018' order by valid_period;

\echo 'save-with-foreign-key-019'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-019', 1, '[3,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-019' order by valid_period;

\echo 'save-with-foreign-key-020'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-020', 1, '[0,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-020' order by valid_period;

\echo 'save-with-foreign-key-021'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-021', 1, '[0,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-021' order by valid_period;

\echo 'save-with-foreign-key-022'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-022', 1, '[6,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-022' order by valid_period;

\echo 'save-with-foreign-key-023'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-023', 1, '[0,1]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-023' order by valid_period;

\echo 'save-with-foreign-key-024'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-024', 1, '[8,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-024' order by valid_period;

\echo 'save-with-foreign-key-025'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-025', 1, '(,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-025' order by valid_period;

\echo 'save-with-foreign-key-026'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-026', 1, '(,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-026' order by valid_period;

\echo 'save-with-foreign-key-027'
call sample.save_sp('s-for-fk-3', 'save-with-foreign-key-027', 1, '[6,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-027' order by valid_period;

\echo 'save-with-foreign-key-028'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-028', 1, '[3,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-028' order by valid_period;

\echo 'save-with-foreign-key-029'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-029', 1, '[0,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-029' order by valid_period;

\echo 'save-with-foreign-key-030'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-030', 1, '[0,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-030' order by valid_period;

\echo 'save-with-foreign-key-031'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-031', 1, '[6,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-031' order by valid_period;

\echo 'save-with-foreign-key-032'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-032', 1, '[0,1]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-032' order by valid_period;

\echo 'save-with-foreign-key-033'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-033', 1, '[8,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-033' order by valid_period;

\echo 'save-with-foreign-key-034'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-034', 1, '(,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-034' order by valid_period;

\echo 'save-with-foreign-key-035'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-035', 1, '(,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-035' order by valid_period;

\echo 'save-with-foreign-key-036'
call sample.save_sp('s-for-fk-4', 'save-with-foreign-key-036', 1, '[6,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-036' order by valid_period;

\echo 'save-with-foreign-key-037'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-037', 1, '[3,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-037' order by valid_period;

\echo 'save-with-foreign-key-038'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-038', 1, '[0,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-038' order by valid_period;

\echo 'save-with-foreign-key-039'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-039', 1, '[0,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-039' order by valid_period;

\echo 'save-with-foreign-key-040'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-040', 1, '[6,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-040' order by valid_period;

\echo 'save-with-foreign-key-041'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-041', 1, '[0,1]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-041' order by valid_period;

\echo 'save-with-foreign-key-042'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-042', 1, '[8,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-042' order by valid_period;

\echo 'save-with-foreign-key-043'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-043', 1, '(,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-043' order by valid_period;

\echo 'save-with-foreign-key-044'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-044', 1, '(,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-044' order by valid_period;

\echo 'save-with-foreign-key-045'
call sample.save_sp('s-for-fk-5', 'save-with-foreign-key-045', 1, '[6,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-045' order by valid_period;

\echo 'save-with-foreign-key-046'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-046', 1, '[3,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-046' order by valid_period;

\echo 'save-with-foreign-key-047'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-047', 1, '[0,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-047' order by valid_period;

\echo 'save-with-foreign-key-048'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-048', 1, '[0,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-048' order by valid_period;

\echo 'save-with-foreign-key-049'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-049', 1, '[6,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-049' order by valid_period;

\echo 'save-with-foreign-key-050'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-050', 1, '[0,1]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-050' order by valid_period;

\echo 'save-with-foreign-key-051'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-051', 1, '[8,9]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-051' order by valid_period;

\echo 'save-with-foreign-key-052'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-052', 1, '(,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-052' order by valid_period;

\echo 'save-with-foreign-key-053'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-053', 1, '(,3]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-053' order by valid_period;

\echo 'save-with-foreign-key-054'
call sample.save_sp('s-for-fk-6', 'save-with-foreign-key-054', 1, '[6,)');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-054' order by valid_period;

\echo 'save-with-foreign-key-055'
call sample.save_s('s-for-fk-7', 1, '[0,10]');
call sample.save_sp('s-for-fk-7', 'save-with-foreign-key-055', 1, '[0,10]');
call sample.save_s('s-for-fk-7', 2, '[4,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-055' order by valid_period;

\echo 'save-with-foreign-key-056'
call sample.save_s('s-for-fk-8', 1, '[0,10]');
call sample.save_sp('s-for-fk-8', 'save-with-foreign-key-056', 1, '[0,10]');
call sample.save_sp('s-for-fk-8', 'save-with-foreign-key-056', 2, '[4,6]');
select s_id, id, state, valid_period from sample.sp where id = 'save-with-foreign-key-056' order by valid_period;

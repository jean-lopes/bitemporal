\set QUIET 'on'

truncate sample.sp cascade;
truncate sample.s cascade;
truncate sample_history.s cascade;

\echo 'save-000 - [empty]'
insert into sample.s(id, value, valid_period) values ('save-000', 1, '[0,5)');
call sample.save_s('save-000', 0, 'empty');

\echo 'save-001 - [uuuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-001', 1, '[,)');
call sample.save_s('save-001', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-001' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-001' order by system_period, valid_period, id;

\echo 'save-002 - [uuub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-002', 1, '[,)');
call sample.save_s('save-002', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-002' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-002' order by system_period, valid_period, id;

\echo 'save-003 - [uubu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-003', 1, '[,)');
call sample.save_s('save-003', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-003' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-003' order by system_period, valid_period, id;

\echo 'save-004 - [uubb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-004', 1, '[,)');
call sample.save_s('save-004', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-004' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-004' order by system_period, valid_period, id;

\echo 'save-005 - [ubuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-005', 1, '[,80)');
call sample.save_s('save-005', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-005' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-005' order by system_period, valid_period, id;

\echo 'save-006 - [ubub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-006', 1, '[,80)');
call sample.save_s('save-006', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-006' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-006' order by system_period, valid_period, id;

\echo 'save-007 - [ubbu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-007', 1, '[,80)');
call sample.save_s('save-007', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-007' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-007' order by system_period, valid_period, id;

\echo 'save-008 - [ubbb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-008', 1, '[,80)');
call sample.save_s('save-008', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-008' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-008' order by system_period, valid_period, id;

\echo 'save-009 - [buuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-009', 1, '[0,)');
call sample.save_s('save-009', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-009' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-009' order by system_period, valid_period, id;

\echo 'save-010 - [buub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-010', 1, '[0,)');
call sample.save_s('save-010', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-010' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-010' order by system_period, valid_period, id;

\echo 'save-011 - [bubu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-011', 1, '[0,)');
call sample.save_s('save-011', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-011' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-011' order by system_period, valid_period, id;

\echo 'save-012 - [bubb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-012', 1, '[0,)');
call sample.save_s('save-012', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-012' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-012' order by system_period, valid_period, id;

\echo 'save-013 - [bbuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-013', 1, '[0,80)');
call sample.save_s('save-013', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-013' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-013' order by system_period, valid_period, id;

\echo 'save-014 - [bbub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-014', 1, '[0,80)');
call sample.save_s('save-014', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-014' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-014' order by system_period, valid_period, id;

\echo 'save-015 - [bbbu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-015', 1, '[0,80)');
call sample.save_s('save-015', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-015' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-015' order by system_period, valid_period, id;

\echo 'save-016 - [bbbb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-016', 1, '[0,80)');
call sample.save_s('save-016', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-016' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-016' order by system_period, valid_period, id;

\echo 'save-017 - [uuuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-017', 0, '[,)');
call sample.save_s('save-017', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-017' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-017' order by system_period, valid_period, id;

\echo 'save-018 - [uuub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-018', 0, '[,)');
call sample.save_s('save-018', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-018' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-018' order by system_period, valid_period, id;

\echo 'save-019 - [uubu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-019', 0, '[,)');
call sample.save_s('save-019', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-019' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-019' order by system_period, valid_period, id;

\echo 'save-020 - [uubb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-020', 0, '[,)');
call sample.save_s('save-020', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-020' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-020' order by system_period, valid_period, id;

\echo 'save-021 - [ubuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-021', 0, '[,80)');
call sample.save_s('save-021', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-021' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-021' order by system_period, valid_period, id;

\echo 'save-022 - [ubub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-022', 0, '[,80)');
call sample.save_s('save-022', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-022' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-022' order by system_period, valid_period, id;

\echo 'save-023 - [ubbu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-023', 0, '[,80)');
call sample.save_s('save-023', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-023' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-023' order by system_period, valid_period, id;

\echo 'save-024 - [ubbb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-024', 0, '[,80)');
call sample.save_s('save-024', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-024' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-024' order by system_period, valid_period, id;

\echo 'save-025 - [buuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-025', 0, '[0,)');
call sample.save_s('save-025', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-025' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-025' order by system_period, valid_period, id;

\echo 'save-026 - [buub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-026', 0, '[0,)');
call sample.save_s('save-026', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-026' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-026' order by system_period, valid_period, id;

\echo 'save-027 - [bubu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-027', 0, '[0,)');
call sample.save_s('save-027', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-027' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-027' order by system_period, valid_period, id;

\echo 'save-028 - [bubb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-028', 0, '[0,)');
call sample.save_s('save-028', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-028' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-028' order by system_period, valid_period, id;

\echo 'save-029 - [bbuu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-029', 0, '[0,80)');
call sample.save_s('save-029', 0, '[,)');
select id, value, valid_period, system_period from sample.s where id = 'save-029' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-029' order by system_period, valid_period, id;

\echo 'save-030 - [bbub]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-030', 0, '[0,80)');
call sample.save_s('save-030', 0, '[,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-030' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-030' order by system_period, valid_period, id;

\echo 'save-031 - [bbbu]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-031', 0, '[0,80)');
call sample.save_s('save-031', 0, '[25,)');
select id, value, valid_period, system_period from sample.s where id = 'save-031' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-031' order by system_period, valid_period, id;

\echo 'save-032 - [bbbb]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-032', 0, '[0,80)');
call sample.save_s('save-032', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-032' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-032' order by system_period, valid_period, id;

\echo 'save-033 - [----]'
select setval('sample_history.system_time', 0);
call sample.save_s('save-033', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-033' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-033' order by system_period, valid_period, id;

\echo 'save-034 - [---c]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-034', 0, '[20, 25)');
call sample.save_s('save-034', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-034' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-034' order by system_period, valid_period, id;

\echo 'save-035 - [---s]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-035', 1, '[ 0,  5)');
call sample.save_s('save-035', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-035' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-035' order by system_period, valid_period, id;

\echo 'save-036 - [---o]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-036', 1, '[20, 30)');
call sample.save_s('save-036', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-036' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-036' order by system_period, valid_period, id;

\echo 'save-037 - [--cs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-037', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-037', 1, '[ 0,  5)');
call sample.save_s('save-037', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-037' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-037' order by system_period, valid_period, id;

\echo 'save-038 - [--sc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-038', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-038', 0, '[20, 25)');
call sample.save_s('save-038', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-038' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-038' order by system_period, valid_period, id;

\echo 'save-039 - [--ss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-039', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-039', 1, '[ 0,  5)');
call sample.save_s('save-039', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-039' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-039' order by system_period, valid_period, id;

\echo 'save-040 - [--so]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-040', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-040', 1, '[20, 30)');
call sample.save_s('save-040', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-040' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-040' order by system_period, valid_period, id;

\echo 'save-041 - [--oc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-041', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-041', 0, '[20, 25)');
call sample.save_s('save-041', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-041' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-041' order by system_period, valid_period, id;

\echo 'save-042 - [--os]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-042', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-042', 1, '[ 0,  5)');
call sample.save_s('save-042', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-042' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-042' order by system_period, valid_period, id;

\echo 'save-043 - [--oo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-043', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-043', 1, '[20, 30)');
call sample.save_s('save-043', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-043' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-043' order by system_period, valid_period, id;

\echo 'save-044 - [-ccs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-044', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-044', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-044', 1, '[ 0,  5)');
call sample.save_s('save-044', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-044' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-044' order by system_period, valid_period, id;

\echo 'save-045 - [-csc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-045', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-045', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-045', 0, '[20, 25)');
call sample.save_s('save-045', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-045' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-045' order by system_period, valid_period, id;

\echo 'save-046 - [-css]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-046', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-046', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-046', 1, '[ 0,  5)');
call sample.save_s('save-046', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-046' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-046' order by system_period, valid_period, id;

\echo 'save-047 - [-cso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-047', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-047', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-047', 1, '[20, 30)');
call sample.save_s('save-047', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-047' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-047' order by system_period, valid_period, id;

\echo 'save-048 - [-coc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-048', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-048', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-048', 0, '[20, 25)');
call sample.save_s('save-048', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-048' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-048' order by system_period, valid_period, id;

\echo 'save-049 - [-cos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-049', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-049', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-049', 1, '[ 0,  5)');
call sample.save_s('save-049', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-049' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-049' order by system_period, valid_period, id;

\echo 'save-050 - [-coo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-050', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-050', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-050', 1, '[20, 30)');
call sample.save_s('save-050', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-050' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-050' order by system_period, valid_period, id;

\echo 'save-051 - [-scs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-051', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-051', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-051', 1, '[ 0,  5)');
call sample.save_s('save-051', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-051' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-051' order by system_period, valid_period, id;

\echo 'save-052 - [-ssc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-052', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-052', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-052', 0, '[20, 25)');
call sample.save_s('save-052', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-052' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-052' order by system_period, valid_period, id;

\echo 'save-053 - [-sss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-053', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-053', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-053', 1, '[ 0,  5)');
call sample.save_s('save-053', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-053' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-053' order by system_period, valid_period, id;

\echo 'save-054 - [-sso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-054', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-054', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-054', 1, '[20, 30)');
call sample.save_s('save-054', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-054' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-054' order by system_period, valid_period, id;

\echo 'save-055 - [-soc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-055', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-055', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-055', 0, '[20, 25)');
call sample.save_s('save-055', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-055' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-055' order by system_period, valid_period, id;

\echo 'save-056 - [-sos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-056', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-056', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-056', 1, '[ 0,  5)');
call sample.save_s('save-056', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-056' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-056' order by system_period, valid_period, id;

\echo 'save-057 - [-soo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-057', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-057', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-057', 1, '[20, 30)');
call sample.save_s('save-057', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-057' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-057' order by system_period, valid_period, id;

\echo 'save-058 - [-ocs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-058', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-058', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-058', 1, '[ 0,  5)');
call sample.save_s('save-058', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-058' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-058' order by system_period, valid_period, id;

\echo 'save-059 - [-osc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-059', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-059', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-059', 0, '[20, 25)');
call sample.save_s('save-059', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-059' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-059' order by system_period, valid_period, id;

\echo 'save-060 - [-oss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-060', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-060', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-060', 1, '[ 0,  5)');
call sample.save_s('save-060', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-060' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-060' order by system_period, valid_period, id;

\echo 'save-061 - [-oso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-061', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-061', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-061', 1, '[20, 30)');
call sample.save_s('save-061', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-061' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-061' order by system_period, valid_period, id;

\echo 'save-062 - [-ooc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-062', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-062', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-062', 0, '[20, 25)');
call sample.save_s('save-062', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-062' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-062' order by system_period, valid_period, id;

\echo 'save-063 - [-oos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-063', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-063', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-063', 1, '[ 0,  5)');
call sample.save_s('save-063', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-063' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-063' order by system_period, valid_period, id;

\echo 'save-064 - [-ooo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-064', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-064', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-064', 1, '[20, 30)');
call sample.save_s('save-064', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-064' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-064' order by system_period, valid_period, id;

\echo 'save-065 - [cssc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-065', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-065', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-065', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-065', 0, '[20, 25)');
call sample.save_s('save-065', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-065' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-065' order by system_period, valid_period, id;

\echo 'save-066 - [cosc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-066', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-066', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-066', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-066', 0, '[20, 25)');
call sample.save_s('save-066', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-066' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-066' order by system_period, valid_period, id;

\echo 'save-067 - [scsc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-067', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-067', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-067', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-067', 0, '[20, 25)');
call sample.save_s('save-067', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-067' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-067' order by system_period, valid_period, id;

\echo 'save-068 - [sssc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-068', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-068', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-068', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-068', 0, '[20, 25)');
call sample.save_s('save-068', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-068' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-068' order by system_period, valid_period, id;

\echo 'save-069 - [sosc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-069', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-069', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-069', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-069', 0, '[20, 25)');
call sample.save_s('save-069', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-069' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-069' order by system_period, valid_period, id;

\echo 'save-070 - [ossc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-070', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-070', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-070', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-070', 0, '[20, 25)');
call sample.save_s('save-070', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-070' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-070' order by system_period, valid_period, id;

\echo 'save-071 - [oosc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-071', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-071', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-071', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-071', 0, '[20, 25)');
call sample.save_s('save-071', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-071' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-071' order by system_period, valid_period, id;

\echo 'save-072 - [csoc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-072', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-072', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-072', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-072', 0, '[20, 25)');
call sample.save_s('save-072', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-072' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-072' order by system_period, valid_period, id;

\echo 'save-073 - [cooc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-073', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-073', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-073', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-073', 0, '[20, 25)');
call sample.save_s('save-073', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-073' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-073' order by system_period, valid_period, id;

\echo 'save-074 - [scoc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-074', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-074', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-074', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-074', 0, '[20, 25)');
call sample.save_s('save-074', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-074' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-074' order by system_period, valid_period, id;

\echo 'save-075 - [ssoc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-075', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-075', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-075', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-075', 0, '[20, 25)');
call sample.save_s('save-075', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-075' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-075' order by system_period, valid_period, id;

\echo 'save-076 - [sooc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-076', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-076', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-076', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-076', 0, '[20, 25)');
call sample.save_s('save-076', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-076' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-076' order by system_period, valid_period, id;

\echo 'save-077 - [osoc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-077', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-077', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-077', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-077', 0, '[20, 25)');
call sample.save_s('save-077', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-077' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-077' order by system_period, valid_period, id;

\echo 'save-078 - [oooc]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-078', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-078', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-078', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-078', 0, '[20, 25)');
call sample.save_s('save-078', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-078' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-078' order by system_period, valid_period, id;

\echo 'save-079 - [cscs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-079', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-079', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-079', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-079', 1, '[ 0,  5)');
call sample.save_s('save-079', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-079' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-079' order by system_period, valid_period, id;

\echo 'save-080 - [cocs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-080', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-080', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-080', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-080', 1, '[ 0,  5)');
call sample.save_s('save-080', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-080' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-080' order by system_period, valid_period, id;

\echo 'save-081 - [sccs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-081', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-081', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-081', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-081', 1, '[ 0,  5)');
call sample.save_s('save-081', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-081' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-081' order by system_period, valid_period, id;

\echo 'save-082 - [sscs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-082', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-082', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-082', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-082', 1, '[ 0,  5)');
call sample.save_s('save-082', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-082' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-082' order by system_period, valid_period, id;

\echo 'save-083 - [socs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-083', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-083', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-083', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-083', 1, '[ 0,  5)');
call sample.save_s('save-083', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-083' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-083' order by system_period, valid_period, id;

\echo 'save-084 - [oscs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-084', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-084', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-084', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-084', 1, '[ 0,  5)');
call sample.save_s('save-084', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-084' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-084' order by system_period, valid_period, id;

\echo 'save-085 - [oocs]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-085', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-085', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-085', 0, '[20, 25)');
insert into sample.s(id, value, valid_period) values ('save-085', 1, '[ 0,  5)');
call sample.save_s('save-085', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-085' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-085' order by system_period, valid_period, id;

\echo 'save-086 - [csss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-086', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-086', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-086', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-086', 1, '[ 0,  5)');
call sample.save_s('save-086', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-086' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-086' order by system_period, valid_period, id;

\echo 'save-087 - [coss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-087', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-087', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-087', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-087', 1, '[ 0,  5)');
call sample.save_s('save-087', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-087' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-087' order by system_period, valid_period, id;

\echo 'save-088 - [scss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-088', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-088', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-088', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-088', 1, '[ 0,  5)');
call sample.save_s('save-088', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-088' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-088' order by system_period, valid_period, id;

\echo 'save-089 - [ssss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-089', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-089', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-089', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-089', 1, '[ 0,  5)');
call sample.save_s('save-089', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-089' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-089' order by system_period, valid_period, id;

\echo 'save-090 - [soss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-090', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-090', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-090', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-090', 1, '[ 0,  5)');
call sample.save_s('save-090', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-090' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-090' order by system_period, valid_period, id;

\echo 'save-091 - [osss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-091', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-091', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-091', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-091', 1, '[ 0,  5)');
call sample.save_s('save-091', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-091' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-091' order by system_period, valid_period, id;

\echo 'save-092 - [ooss]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-092', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-092', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-092', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-092', 1, '[ 0,  5)');
call sample.save_s('save-092', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-092' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-092' order by system_period, valid_period, id;

\echo 'save-093 - [csos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-093', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-093', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-093', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-093', 1, '[ 0,  5)');
call sample.save_s('save-093', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-093' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-093' order by system_period, valid_period, id;

\echo 'save-094 - [coos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-094', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-094', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-094', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-094', 1, '[ 0,  5)');
call sample.save_s('save-094', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-094' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-094' order by system_period, valid_period, id;

\echo 'save-095 - [scos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-095', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-095', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-095', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-095', 1, '[ 0,  5)');
call sample.save_s('save-095', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-095' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-095' order by system_period, valid_period, id;

\echo 'save-096 - [ssos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-096', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-096', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-096', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-096', 1, '[ 0,  5)');
call sample.save_s('save-096', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-096' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-096' order by system_period, valid_period, id;

\echo 'save-097 - [soos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-097', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-097', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-097', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-097', 1, '[ 0,  5)');
call sample.save_s('save-097', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-097' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-097' order by system_period, valid_period, id;

\echo 'save-098 - [osos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-098', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-098', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-098', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-098', 1, '[ 0,  5)');
call sample.save_s('save-098', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-098' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-098' order by system_period, valid_period, id;

\echo 'save-099 - [ooos]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-099', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-099', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-099', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-099', 1, '[ 0,  5)');
call sample.save_s('save-099', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-099' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-099' order by system_period, valid_period, id;

\echo 'save-100 - [csso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-100', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-100', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-100', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-100', 1, '[20, 30)');
call sample.save_s('save-100', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-100' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-100' order by system_period, valid_period, id;

\echo 'save-101 - [coso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-101', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-101', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-101', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-101', 1, '[20, 30)');
call sample.save_s('save-101', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-101' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-101' order by system_period, valid_period, id;

\echo 'save-102 - [scso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-102', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-102', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-102', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-102', 1, '[20, 30)');
call sample.save_s('save-102', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-102' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-102' order by system_period, valid_period, id;

\echo 'save-103 - [ssso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-103', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-103', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-103', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-103', 1, '[20, 30)');
call sample.save_s('save-103', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-103' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-103' order by system_period, valid_period, id;

\echo 'save-104 - [soso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-104', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-104', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-104', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-104', 1, '[20, 30)');
call sample.save_s('save-104', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-104' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-104' order by system_period, valid_period, id;

\echo 'save-105 - [osso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-105', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-105', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-105', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-105', 1, '[20, 30)');
call sample.save_s('save-105', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-105' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-105' order by system_period, valid_period, id;

\echo 'save-106 - [ooso]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-106', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-106', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-106', 2, '[10, 15)');
insert into sample.s(id, value, valid_period) values ('save-106', 1, '[20, 30)');
call sample.save_s('save-106', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-106' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-106' order by system_period, valid_period, id;

\echo 'save-107 - [csoo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-107', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-107', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-107', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-107', 1, '[20, 30)');
call sample.save_s('save-107', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-107' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-107' order by system_period, valid_period, id;

\echo 'save-108 - [cooo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-108', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-108', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-108', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-108', 1, '[20, 30)');
call sample.save_s('save-108', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-108' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-108' order by system_period, valid_period, id;

\echo 'save-109 - [scoo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-109', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-109', 0, '[55, 60)');
insert into sample.s(id, value, valid_period) values ('save-109', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-109', 1, '[20, 30)');
call sample.save_s('save-109', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-109' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-001' order by system_period, valid_period, id;

\echo 'save-110 - [ssoo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-110', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-110', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-110', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-110', 1, '[20, 30)');
call sample.save_s('save-110', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-110' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-110' order by system_period, valid_period, id;

\echo 'save-111 - [sooo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-111', 4, '[75, 80)');
insert into sample.s(id, value, valid_period) values ('save-111', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-111', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-111', 1, '[20, 30)');
call sample.save_s('save-111', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-111' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-111' order by system_period, valid_period, id;

\echo 'save-112 - [osoo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-112', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-112', 3, '[65, 70)');
insert into sample.s(id, value, valid_period) values ('save-112', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-112', 1, '[20, 30)');
call sample.save_s('save-112', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-112' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-112' order by system_period, valid_period, id;

\echo 'save-113 - [oooo]'
select setval('sample_history.system_time', 0);
insert into sample.s(id, value, valid_period) values ('save-113', 4, '[50, 60)');
insert into sample.s(id, value, valid_period) values ('save-113', 3, '[40, 50)');
insert into sample.s(id, value, valid_period) values ('save-113', 2, '[30, 40)');
insert into sample.s(id, value, valid_period) values ('save-113', 1, '[20, 30)');
call sample.save_s('save-113', 0, '[25,55)');
select id, value, valid_period, system_period from sample.s where id = 'save-113' order by valid_period;
select id, value, valid_period, system_period from sample_history.s where id = 'save-113' order by system_period, valid_period, id;

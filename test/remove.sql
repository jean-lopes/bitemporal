\set QUIET 'on'

truncate sp cascade;
truncate s cascade;

\echo 'remove-000 - [empty]'
insert into s(id, value, valid_period) values ('remove-000', 1, '[0,5)');
call remove_s($$x.id = 'remove-000'$$, 'empty');
select id, value, valid_period from s where id = 'remove-000' order by valid_period;

\echo 'remove-001 - [uuuu]'
insert into s(id, value, valid_period) values ('remove-001', 1, '[,)');
call remove_s($$x.id = 'remove-001'$$, '[,)');
select id, value, valid_period from s where id = 'remove-001' order by valid_period;

\echo 'remove-002 - [uuub]'
insert into s(id, value, valid_period) values ('remove-002', 1, '[,)');
call remove_s($$x.id = 'remove-002'$$, '[,55)');
select id, value, valid_period from s where id = 'remove-002' order by valid_period;

\echo 'remove-003 - [uubu]'
insert into s(id, value, valid_period) values ('remove-003', 1, '[,)');
call remove_s($$x.id = 'remove-003'$$, '[25,)');
select id, value, valid_period from s where id = 'remove-003' order by valid_period;

\echo 'remove-004 - [uubb]'
insert into s(id, value, valid_period) values ('remove-004', 1, '[,)');
call remove_s($$x.id = 'remove-004'$$, '[25,55)');
select id, value, valid_period from s where id = 'remove-004' order by valid_period;

\echo 'remove-005 - [ubuu]'
insert into s(id, value, valid_period) values ('remove-005', 1, '[,80)');
call remove_s($$x.id = 'remove-005'$$, '[,)');
select id, value, valid_period from s where id = 'remove-005' order by valid_period;

\echo 'remove-006 - [ubub]'
insert into s(id, value, valid_period) values ('remove-006', 1, '[,80)');
call remove_s($$x.id = 'remove-006'$$, '[,55)');
select id, value, valid_period from s where id = 'remove-006' order by valid_period;

\echo 'remove-007 - [ubbu]'
insert into s(id, value, valid_period) values ('remove-007', 1, '[,80)');
call remove_s($$x.id = 'remove-007'$$, '[25,)');
select id, value, valid_period from s where id = 'remove-007' order by valid_period;

\echo 'remove-008 - [ubbb]'
insert into s(id, value, valid_period) values ('remove-008', 1, '[,80)');
call remove_s($$x.id = 'remove-008'$$, '[25,55)');
select id, value, valid_period from s where id = 'remove-008' order by valid_period;

\echo 'remove-009 - [buuu]'
insert into s(id, value, valid_period) values ('remove-009', 1, '[0,)');
call remove_s($$x.id = 'remove-009'$$, '[,)');
select id, value, valid_period from s where id = 'remove-009' order by valid_period;

\echo 'remove-010 - [buub]'
insert into s(id, value, valid_period) values ('remove-010', 1, '[0,)');
call remove_s($$x.id = 'remove-010'$$, '[,55)');
select id, value, valid_period from s where id = 'remove-010' order by valid_period;

\echo 'remove-011 - [bubu]'
insert into s(id, value, valid_period) values ('remove-011', 1, '[0,)');
call remove_s($$x.id = 'remove-011'$$, '[25,)');
select id, value, valid_period from s where id = 'remove-011' order by valid_period;
--
\echo 'remove-012 - [bubb]'
insert into s(id, value, valid_period) values ('remove-012', 1, '[0,)');
call remove_s($$x.id = 'remove-012'$$, '[25,55)');
select id, value, valid_period from s where id = 'remove-012' order by valid_period;
--
\echo 'remove-013 - [bbuu]'
insert into s(id, value, valid_period) values ('remove-013', 1, '[0,80)');
call remove_s($$x.id = 'remove-013'$$, '[,)');
select id, value, valid_period from s where id = 'remove-013' order by valid_period;

\echo 'remove-014 - [bbub]'
insert into s(id, value, valid_period) values ('remove-014', 1, '[0,80)');
call remove_s($$x.id = 'remove-014'$$, '[,55)');
select id, value, valid_period from s where id = 'remove-014' order by valid_period;

\echo 'remove-015 - [bbbu]'
insert into s(id, value, valid_period) values ('remove-015', 1, '[0,80)');
call remove_s($$x.id = 'remove-015'$$, '[25,)');
select id, value, valid_period from s where id = 'remove-015' order by valid_period;

\echo 'remove-016 - [bbbb]'
insert into s(id, value, valid_period) values ('remove-016', 1, '[0,80)');
call remove_s($$x.id = 'remove-016'$$, '[25,55)');
select id, value, valid_period from s where id = 'remove-016' order by valid_period;

\echo 'remove-017 - [----]'
call remove_s($$x.id = 'remove-017'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-017' order by valid_period;

\echo 'remove-018 - [---c]'
insert into s(id, value, valid_period) values ('remove-018', 0, '[20, 25)');
call remove_s($$x.id = 'remove-018'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-018' order by valid_period;

\echo 'remove-019 - [---s]'
insert into s(id, value, valid_period) values ('remove-019', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-019'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-019' order by valid_period;

\echo 'remove-020 - [---o]'
insert into s(id, value, valid_period) values ('remove-020', 1, '[20, 30)');
call remove_s($$x.id = 'remove-020'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-020' order by valid_period;

\echo 'remove-021 - [--cs]'
insert into s(id, value, valid_period) values ('remove-021', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-021', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-021'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-021' order by valid_period;

\echo 'remove-022 - [--sc]'
insert into s(id, value, valid_period) values ('remove-022', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-022', 0, '[20, 25)');
call remove_s($$x.id = 'remove-022'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-022' order by valid_period;

\echo 'remove-023 - [--ss]'
insert into s(id, value, valid_period) values ('remove-023', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-023', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-023'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-023' order by valid_period;

\echo 'remove-024 - [--so]'
insert into s(id, value, valid_period) values ('remove-024', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-024', 1, '[20, 30)');
call remove_s($$x.id = 'remove-024'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-024' order by valid_period;

\echo 'remove-025 - [--oc]'
insert into s(id, value, valid_period) values ('remove-025', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-025', 0, '[20, 25)');
call remove_s($$x.id = 'remove-025'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-025' order by valid_period;

\echo 'remove-026 - [--os]'
insert into s(id, value, valid_period) values ('remove-026', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-026', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-026'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-026' order by valid_period;

\echo 'remove-027 - [--oo]'
insert into s(id, value, valid_period) values ('remove-027', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-027', 1, '[20, 30)');
call remove_s($$x.id = 'remove-027'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-027' order by valid_period;

\echo 'remove-028 - [-ccs]'
insert into s(id, value, valid_period) values ('remove-028', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-028', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-028', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-028'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-028' order by valid_period;

\echo 'remove-029 - [-csc]'
insert into s(id, value, valid_period) values ('remove-029', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-029', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-029', 0, '[20, 25)');
call remove_s($$x.id = 'remove-029'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-029' order by valid_period;

\echo 'remove-030 - [-css]'
insert into s(id, value, valid_period) values ('remove-030', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-030', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-030', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-030'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-030' order by valid_period;

\echo 'remove-031 - [-cso]'
insert into s(id, value, valid_period) values ('remove-031', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-031', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-031', 1, '[20, 30)');
call remove_s($$x.id = 'remove-031'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-031' order by valid_period;

\echo 'remove-032 - [-coc]'
insert into s(id, value, valid_period) values ('remove-032', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-032', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-032', 0, '[20, 25)');
call remove_s($$x.id = 'remove-032'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-032' order by valid_period;

\echo 'remove-033 - [-cos]'
insert into s(id, value, valid_period) values ('remove-033', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-033', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-033', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-033'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-033' order by valid_period;

\echo 'remove-034 - [-coo]'
insert into s(id, value, valid_period) values ('remove-034', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-034', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-034', 1, '[20, 30)');
call remove_s($$x.id = 'remove-034'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-034' order by valid_period;

\echo 'remove-035 - [-scs]'
insert into s(id, value, valid_period) values ('remove-035', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-035', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-035', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-035'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-035' order by valid_period;

\echo 'remove-036 - [-ssc]'
insert into s(id, value, valid_period) values ('remove-036', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-036', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-036', 0, '[20, 25)');
call remove_s($$x.id = 'remove-036'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-036' order by valid_period;

\echo 'remove-037 - [-sss]'
insert into s(id, value, valid_period) values ('remove-037', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-037', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-037', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-037'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-037' order by valid_period;

\echo 'remove-038 - [-sso]'
insert into s(id, value, valid_period) values ('remove-038', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-038', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-038', 1, '[20, 30)');
call remove_s($$x.id = 'remove-038'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-038' order by valid_period;

\echo 'remove-039 - [-soc]'
insert into s(id, value, valid_period) values ('remove-039', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-039', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-039', 0, '[20, 25)');
call remove_s($$x.id = 'remove-039'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-039' order by valid_period;

\echo 'remove-040 - [-sos]'
insert into s(id, value, valid_period) values ('remove-040', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-040', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-040', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-040'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-040' order by valid_period;

\echo 'remove-041 - [-soo]'
insert into s(id, value, valid_period) values ('remove-041', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-041', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-041', 1, '[20, 30)');
call remove_s($$x.id = 'remove-041'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-041' order by valid_period;

\echo 'remove-042 - [-ocs]'
insert into s(id, value, valid_period) values ('remove-042', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-042', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-042', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-042'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-042' order by valid_period;

\echo 'remove-043 - [-osc]'
insert into s(id, value, valid_period) values ('remove-043', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-043', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-043', 0, '[20, 25)');
call remove_s($$x.id = 'remove-043'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-043' order by valid_period;

\echo 'remove-044 - [-oss]'
insert into s(id, value, valid_period) values ('remove-044', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-044', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-044', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-044'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-044' order by valid_period;

\echo 'remove-045 - [-oso]'
insert into s(id, value, valid_period) values ('remove-045', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-045', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-045', 1, '[20, 30)');
call remove_s($$x.id = 'remove-045'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-045' order by valid_period;

\echo 'remove-046 - [-ooc]'
insert into s(id, value, valid_period) values ('remove-046', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-046', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-046', 0, '[20, 25)');
call remove_s($$x.id = 'remove-046'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-046' order by valid_period;

\echo 'remove-047 - [-oos]'
insert into s(id, value, valid_period) values ('remove-047', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-047', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-047', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-047'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-047' order by valid_period;

\echo 'remove-048 - [-ooo]'
insert into s(id, value, valid_period) values ('remove-048', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-048', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-048', 1, '[20, 30)');
call remove_s($$x.id = 'remove-048'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-048' order by valid_period;

\echo 'remove-049 - [cssc]'
insert into s(id, value, valid_period) values ('remove-049', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-049', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-049', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-049', 0, '[20, 25)');
call remove_s($$x.id = 'remove-049'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-049' order by valid_period;

\echo 'remove-050 - [cosc]'
insert into s(id, value, valid_period) values ('remove-050', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-050', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-050', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-050', 0, '[20, 25)');
call remove_s($$x.id = 'remove-050'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-050' order by valid_period;

\echo 'remove-051 - [scsc]'
insert into s(id, value, valid_period) values ('remove-051', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-051', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-051', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-051', 0, '[20, 25)');
call remove_s($$x.id = 'remove-051'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-051' order by valid_period;

\echo 'remove-052 - [sssc]'
insert into s(id, value, valid_period) values ('remove-052', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-052', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-052', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-052', 0, '[20, 25)');
call remove_s($$x.id = 'remove-052'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-052' order by valid_period;

\echo 'remove-053 - [sosc]'
insert into s(id, value, valid_period) values ('remove-053', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-053', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-053', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-053', 0, '[20, 25)');
call remove_s($$x.id = 'remove-053'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-053' order by valid_period;

\echo 'remove-054 - [ossc]'
insert into s(id, value, valid_period) values ('remove-054', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-054', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-054', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-054', 0, '[20, 25)');
call remove_s($$x.id = 'remove-054'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-054' order by valid_period;

\echo 'remove-055 - [oosc]'
insert into s(id, value, valid_period) values ('remove-055', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-055', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-055', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-055', 0, '[20, 25)');
call remove_s($$x.id = 'remove-055'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-055' order by valid_period;

\echo 'remove-056 - [csoc]'
insert into s(id, value, valid_period) values ('remove-056', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-056', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-056', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-056', 0, '[20, 25)');
call remove_s($$x.id = 'remove-056'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-056' order by valid_period;

\echo 'remove-057 - [cooc]'
insert into s(id, value, valid_period) values ('remove-057', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-057', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-057', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-057', 0, '[20, 25)');
call remove_s($$x.id = 'remove-057'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-057' order by valid_period;

\echo 'remove-058 - [scoc]'
insert into s(id, value, valid_period) values ('remove-058', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-058', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-058', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-058', 0, '[20, 25)');
call remove_s($$x.id = 'remove-058'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-058' order by valid_period;

\echo 'remove-059 - [ssoc]'
insert into s(id, value, valid_period) values ('remove-059', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-059', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-059', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-059', 0, '[20, 25)');
call remove_s($$x.id = 'remove-059'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-059' order by valid_period;

\echo 'remove-060 - [sooc]'
insert into s(id, value, valid_period) values ('remove-060', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-060', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-060', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-060', 0, '[20, 25)');
call remove_s($$x.id = 'remove-060'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-060' order by valid_period;

\echo 'remove-061 - [osoc]'
insert into s(id, value, valid_period) values ('remove-061', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-061', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-061', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-061', 0, '[20, 25)');
call remove_s($$x.id = 'remove-061'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-061' order by valid_period;

\echo 'remove-062 - [oooc]'
insert into s(id, value, valid_period) values ('remove-062', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-062', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-062', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-062', 0, '[20, 25)');
call remove_s($$x.id = 'remove-062'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-062' order by valid_period;

\echo 'remove-063 - [cscs]'
insert into s(id, value, valid_period) values ('remove-063', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-063', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-063', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-063', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-063'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-063' order by valid_period;

\echo 'remove-064 - [cocs]'
insert into s(id, value, valid_period) values ('remove-064', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-064', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-064', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-064', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-064'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-064' order by valid_period;

\echo 'remove-065 - [sccs]'
insert into s(id, value, valid_period) values ('remove-065', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-065', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-065', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-065', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-065'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-065' order by valid_period;

\echo 'remove-066 - [sscs]'
insert into s(id, value, valid_period) values ('remove-066', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-066', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-066', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-066', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-066'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-066' order by valid_period;

\echo 'remove-067 - [socs]'
insert into s(id, value, valid_period) values ('remove-067', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-067', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-067', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-067', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-067'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-067' order by valid_period;

\echo 'remove-068 - [oscs]'
insert into s(id, value, valid_period) values ('remove-068', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-068', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-068', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-068', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-068'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-068' order by valid_period;

\echo 'remove-069 - [oocs]'
insert into s(id, value, valid_period) values ('remove-069', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-069', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-069', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('remove-069', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-069'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-069' order by valid_period;

\echo 'remove-070 - [csss]'
insert into s(id, value, valid_period) values ('remove-070', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-070', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-070', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-070', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-070'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-070' order by valid_period;

\echo 'remove-071 - [coss]'
insert into s(id, value, valid_period) values ('remove-071', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-071', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-071', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-071', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-071'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-071' order by valid_period;

\echo 'remove-072 - [scss]'
insert into s(id, value, valid_period) values ('remove-072', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-072', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-072', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-072', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-072'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-072' order by valid_period;

\echo 'remove-073 - [ssss]'
insert into s(id, value, valid_period) values ('remove-073', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-073', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-073', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-073', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-073'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-073' order by valid_period;

\echo 'remove-074 - [soss]'
insert into s(id, value, valid_period) values ('remove-074', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-074', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-074', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-074', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-074'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-074' order by valid_period;

\echo 'remove-075 - [osss]'
insert into s(id, value, valid_period) values ('remove-075', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-075', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-075', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-075', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-075'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-075' order by valid_period;

\echo 'remove-076 - [ooss]'
insert into s(id, value, valid_period) values ('remove-076', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-076', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-076', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-076', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-076'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-076' order by valid_period;

\echo 'remove-077 - [csos]'
insert into s(id, value, valid_period) values ('remove-077', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-077', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-077', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-077', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-077'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-077' order by valid_period;

\echo 'remove-078 - [coos]'
insert into s(id, value, valid_period) values ('remove-078', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-078', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-078', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-078', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-078'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-078' order by valid_period;

\echo 'remove-079 - [scos]'
insert into s(id, value, valid_period) values ('remove-079', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-079', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-079', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-079', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-079'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-079' order by valid_period;

\echo 'remove-080 - [ssos]'
insert into s(id, value, valid_period) values ('remove-080', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-080', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-080', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-080', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-080'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-080' order by valid_period;

\echo 'remove-081 - [soos]'
insert into s(id, value, valid_period) values ('remove-081', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-081', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-081', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-081', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-081'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-081' order by valid_period;

\echo 'remove-082 - [osos]'
insert into s(id, value, valid_period) values ('remove-082', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-082', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-082', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-082', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-082'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-082' order by valid_period;

\echo 'remove-083 - [ooos]'
insert into s(id, value, valid_period) values ('remove-083', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-083', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-083', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-083', 1, '[ 0,  5)');
call remove_s($$x.id = 'remove-083'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-083' order by valid_period;

\echo 'remove-084 - [csso]'
insert into s(id, value, valid_period) values ('remove-084', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-084', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-084', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-084', 1, '[20, 30)');
call remove_s($$x.id = 'remove-084'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-084' order by valid_period;

\echo 'remove-085 - [coso]'
insert into s(id, value, valid_period) values ('remove-085', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-085', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-085', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-085', 1, '[20, 30)');
call remove_s($$x.id = 'remove-085'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-085' order by valid_period;

\echo 'remove-086 - [scso]'
insert into s(id, value, valid_period) values ('remove-086', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-086', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-086', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-086', 1, '[20, 30)');
call remove_s($$x.id = 'remove-086'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-086' order by valid_period;

\echo 'remove-087 - [ssso]'
insert into s(id, value, valid_period) values ('remove-087', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-087', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-087', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-087', 1, '[20, 30)');
call remove_s($$x.id = 'remove-087'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-087' order by valid_period;

\echo 'remove-088 - [soso]'
insert into s(id, value, valid_period) values ('remove-088', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-088', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-088', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-088', 1, '[20, 30)');
call remove_s($$x.id = 'remove-088'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-088' order by valid_period;

\echo 'remove-089 - [osso]'
insert into s(id, value, valid_period) values ('remove-089', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-089', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-089', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-089', 1, '[20, 30)');
call remove_s($$x.id = 'remove-089'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-089' order by valid_period;

\echo 'remove-090 - [ooso]'
insert into s(id, value, valid_period) values ('remove-090', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-090', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-090', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('remove-090', 1, '[20, 30)');
call remove_s($$x.id = 'remove-090'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-090' order by valid_period;

\echo 'remove-091 - [csoo]'
insert into s(id, value, valid_period) values ('remove-091', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-091', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-091', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-091', 1, '[20, 30)');
call remove_s($$x.id = 'remove-091'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-091' order by valid_period;

\echo 'remove-092 - [cooo]'
insert into s(id, value, valid_period) values ('remove-092', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-092', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-092', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-092', 1, '[20, 30)');
call remove_s($$x.id = 'remove-092'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-092' order by valid_period;

\echo 'remove-093 - [scoo]'
insert into s(id, value, valid_period) values ('remove-093', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-093', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('remove-093', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-093', 1, '[20, 30)');
call remove_s($$x.id = 'remove-093'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-093' order by valid_period;

\echo 'remove-094 - [ssoo]'
insert into s(id, value, valid_period) values ('remove-094', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-094', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-094', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-094', 1, '[20, 30)');
call remove_s($$x.id = 'remove-094'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-094' order by valid_period;

\echo 'remove-095 - [sooo]'
insert into s(id, value, valid_period) values ('remove-095', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('remove-095', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-095', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-095', 1, '[20, 30)');
call remove_s($$x.id = 'remove-095'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-095' order by valid_period;

\echo 'remove-096 - [osoo]'
insert into s(id, value, valid_period) values ('remove-096', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-096', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('remove-096', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-096', 1, '[20, 30)');
call remove_s($$x.id = 'remove-096'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-096' order by valid_period;

\echo 'remove-097 - [oooo]'
insert into s(id, value, valid_period) values ('remove-097', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('remove-097', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('remove-097', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('remove-097', 1, '[20, 30)');
call remove_s($$x.id = 'remove-097'$$, '[25, 55)');
select id, value, valid_period from s where id = 'remove-097' order by valid_period;

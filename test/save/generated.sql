\set QUIET 'on'

delete from s where id like 'generated-save_s-%';

\echo 'generated-save_s-01 - [----]'
call oracle_save_s('generated-save_s-01');
call save_s('generated-save_s-01', 0, '[25, 55)');

\echo 'generated-save_s-02 - [---o]'
insert into s(id, value, valid_period) values ('generated-save_s-02', 1, '[20, 30)');
call oracle_save_s('generated-save_s-02');
call save_s('generated-save_s-02', 0, '[25, 55)');

\echo 'generated-save_s-03 - [---c]'
insert into s(id, value, valid_period) values ('generated-save_s-03', 0, '[20, 25)');
call oracle_save_s('generated-save_s-03');
call save_s('generated-save_s-03', 0, '[25, 55)');

\echo 'generated-save_s-04 - [---s]'
insert into s(id, value, valid_period) values ('generated-save_s-04', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-04');
call save_s('generated-save_s-04', 0, '[25, 55)');

\echo 'generated-save_s-05 - [--oo]'
insert into s(id, value, valid_period) values ('generated-save_s-05', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-05', 1, '[20, 30)');
call oracle_save_s('generated-save_s-05');
call save_s('generated-save_s-05', 0, '[25, 55)');

\echo 'generated-save_s-06 - [--oc]'
insert into s(id, value, valid_period) values ('generated-save_s-06', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-06', 0, '[20, 25)');
call oracle_save_s('generated-save_s-06');
call save_s('generated-save_s-06', 0, '[25, 55)');

\echo 'generated-save_s-07 - [--os]'
insert into s(id, value, valid_period) values ('generated-save_s-07', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-07', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-07');
call save_s('generated-save_s-07', 0, '[25, 55)');

\echo 'generated-save_s-08 - [--cs]'
insert into s(id, value, valid_period) values ('generated-save_s-08', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-08', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-08');
call save_s('generated-save_s-08', 0, '[25, 55)');

\echo 'generated-save_s-09 - [--so]'
insert into s(id, value, valid_period) values ('generated-save_s-09', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-09', 1, '[20, 30)');
call oracle_save_s('generated-save_s-09');
call save_s('generated-save_s-09', 0, '[25, 55)');

\echo 'generated-save_s-10 - [--sc]'
insert into s(id, value, valid_period) values ('generated-save_s-10', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-10', 0, '[20, 25)');
call oracle_save_s('generated-save_s-10');
call save_s('generated-save_s-10', 0, '[25, 55)');

\echo 'generated-save_s-11 - [--ss]'
insert into s(id, value, valid_period) values ('generated-save_s-11', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-11', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-11');
call save_s('generated-save_s-11', 0, '[25, 55)');

\echo 'generated-save_s-12 - [-ooo]'
insert into s(id, value, valid_period) values ('generated-save_s-12', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-12', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-12', 1, '[20, 30)');
call oracle_save_s('generated-save_s-12');
call save_s('generated-save_s-12', 0, '[25, 55)');

\echo 'generated-save_s-13 - [-coo]'
insert into s(id, value, valid_period) values ('generated-save_s-13', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-13', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-13', 1, '[20, 30)');
call oracle_save_s('generated-save_s-13');
call save_s('generated-save_s-13', 0, '[25, 55)');

\echo 'generated-save_s-14 - [-soo]'
insert into s(id, value, valid_period) values ('generated-save_s-14', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-14', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-14', 1, '[20, 30)');
call oracle_save_s('generated-save_s-14');
call save_s('generated-save_s-14', 0, '[25, 55)');

\echo 'generated-save_s-15 - [-ooc]'
insert into s(id, value, valid_period) values ('generated-save_s-15', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-15', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-15', 0, '[20, 25)');
call oracle_save_s('generated-save_s-15');
call save_s('generated-save_s-15', 0, '[25, 55)');

\echo 'generated-save_s-16 - [-coc]'
insert into s(id, value, valid_period) values ('generated-save_s-16', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-16', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-16', 0, '[20, 25)');
call oracle_save_s('generated-save_s-16');
call save_s('generated-save_s-16', 0, '[25, 55)');

\echo 'generated-save_s-17 - [-soc]'
insert into s(id, value, valid_period) values ('generated-save_s-17', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-17', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-17', 0, '[20, 25)');
call oracle_save_s('generated-save_s-17');
call save_s('generated-save_s-17', 0, '[25, 55)');

\echo 'generated-save_s-18 - [-oos]'
insert into s(id, value, valid_period) values ('generated-save_s-18', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-18', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-18', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-18');
call save_s('generated-save_s-18', 0, '[25, 55)');

\echo 'generated-save_s-19 - [-cos]'
insert into s(id, value, valid_period) values ('generated-save_s-19', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-19', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-19', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-19');
call save_s('generated-save_s-19', 0, '[25, 55)');

\echo 'generated-save_s-20 - [-sos]'
insert into s(id, value, valid_period) values ('generated-save_s-20', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-20', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-20', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-20');
call save_s('generated-save_s-20', 0, '[25, 55)');

\echo 'generated-save_s-21 - [-ocs]'
insert into s(id, value, valid_period) values ('generated-save_s-21', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-21', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-21', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-21');
call save_s('generated-save_s-21', 0, '[25, 55)');

\echo 'generated-save_s-22 - [-ccs]'
insert into s(id, value, valid_period) values ('generated-save_s-22', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-22', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-22', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-22');
call save_s('generated-save_s-22', 0, '[25, 55)');

\echo 'generated-save_s-23 - [-scs]'
insert into s(id, value, valid_period) values ('generated-save_s-23', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-23', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-23', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-23');
call save_s('generated-save_s-23', 0, '[25, 55)');

\echo 'generated-save_s-24 - [-oso]'
insert into s(id, value, valid_period) values ('generated-save_s-24', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-24', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-24', 1, '[20, 30)');
call oracle_save_s('generated-save_s-24');
call save_s('generated-save_s-24', 0, '[25, 55)');

\echo 'generated-save_s-25 - [-cso]'
insert into s(id, value, valid_period) values ('generated-save_s-25', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-25', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-25', 1, '[20, 30)');
call oracle_save_s('generated-save_s-25');
call save_s('generated-save_s-25', 0, '[25, 55)');

\echo 'generated-save_s-26 - [-sso]'
insert into s(id, value, valid_period) values ('generated-save_s-26', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-26', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-26', 1, '[20, 30)');
call oracle_save_s('generated-save_s-26');
call save_s('generated-save_s-26', 0, '[25, 55)');

\echo 'generated-save_s-27 - [-osc]'
insert into s(id, value, valid_period) values ('generated-save_s-27', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-27', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-27', 0, '[20, 25)');
call oracle_save_s('generated-save_s-27');
call save_s('generated-save_s-27', 0, '[25, 55)');

\echo 'generated-save_s-28 - [-csc]'
insert into s(id, value, valid_period) values ('generated-save_s-28', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-28', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-28', 0, '[20, 25)');
call oracle_save_s('generated-save_s-28');
call save_s('generated-save_s-28', 0, '[25, 55)');

\echo 'generated-save_s-29 - [-ssc]'
insert into s(id, value, valid_period) values ('generated-save_s-29', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-29', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-29', 0, '[20, 25)');
call oracle_save_s('generated-save_s-29');
call save_s('generated-save_s-29', 0, '[25, 55)');

\echo 'generated-save_s-30 - [-oss]'
insert into s(id, value, valid_period) values ('generated-save_s-30', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-30', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-30', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-30');
call save_s('generated-save_s-30', 0, '[25, 55)');

\echo 'generated-save_s-31 - [-css]'
insert into s(id, value, valid_period) values ('generated-save_s-31', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-31', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-31', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-31');
call save_s('generated-save_s-31', 0, '[25, 55)');

\echo 'generated-save_s-32 - [-sss]'
insert into s(id, value, valid_period) values ('generated-save_s-32', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-32', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-32', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-32');
call save_s('generated-save_s-32', 0, '[25, 55)');

\echo 'generated-save_s-33 - [oooo]'
insert into s(id, value, valid_period) values ('generated-save_s-33', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-33', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-33', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-33', 1, '[20, 30)');
call oracle_save_s('generated-save_s-33');
call save_s('generated-save_s-33', 0, '[25, 55)');

\echo 'generated-save_s-34 - [oooc]'
insert into s(id, value, valid_period) values ('generated-save_s-34', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-34', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-34', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-34', 0, '[20, 25)');
call oracle_save_s('generated-save_s-34');
call save_s('generated-save_s-34', 0, '[25, 55)');

\echo 'generated-save_s-35 - [ooos]'
insert into s(id, value, valid_period) values ('generated-save_s-35', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-35', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-35', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-35', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-35');
call save_s('generated-save_s-35', 0, '[25, 55)');

\echo 'generated-save_s-36 - [oocs]'
insert into s(id, value, valid_period) values ('generated-save_s-36', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-36', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-36', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-36', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-36');
call save_s('generated-save_s-36', 0, '[25, 55)');

\echo 'generated-save_s-37 - [ooso]'
insert into s(id, value, valid_period) values ('generated-save_s-37', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-37', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-37', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-37', 1, '[20, 30)');
call oracle_save_s('generated-save_s-37');
call save_s('generated-save_s-37', 0, '[25, 55)');

\echo 'generated-save_s-38 - [oosc]'
insert into s(id, value, valid_period) values ('generated-save_s-38', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-38', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-38', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-38', 0, '[20, 25)');
call oracle_save_s('generated-save_s-38');
call save_s('generated-save_s-38', 0, '[25, 55)');

\echo 'generated-save_s-39 - [ooss]'
insert into s(id, value, valid_period) values ('generated-save_s-39', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-39', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-39', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-39', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-39');
call save_s('generated-save_s-39', 0, '[25, 55)');

\echo 'generated-save_s-40 - [osoo]'
insert into s(id, value, valid_period) values ('generated-save_s-40', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-40', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-40', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-40', 1, '[20, 30)');
call oracle_save_s('generated-save_s-40');
call save_s('generated-save_s-40', 0, '[25, 55)');

\echo 'generated-save_s-41 - [osoc]'
insert into s(id, value, valid_period) values ('generated-save_s-41', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-41', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-41', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-41', 0, '[20, 25)');
call oracle_save_s('generated-save_s-41');
call save_s('generated-save_s-41', 0, '[25, 55)');

\echo 'generated-save_s-42 - [osos]'
insert into s(id, value, valid_period) values ('generated-save_s-42', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-42', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-42', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-42', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-42');
call save_s('generated-save_s-42', 0, '[25, 55)');

\echo 'generated-save_s-43 - [oscs]'
insert into s(id, value, valid_period) values ('generated-save_s-43', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-43', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-43', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-43', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-43');
call save_s('generated-save_s-43', 0, '[25, 55)');

\echo 'generated-save_s-44 - [osso]'
insert into s(id, value, valid_period) values ('generated-save_s-44', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-44', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-44', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-44', 1, '[20, 30)');
call oracle_save_s('generated-save_s-44');
call save_s('generated-save_s-44', 0, '[25, 55)');

\echo 'generated-save_s-45 - [ossc]'
insert into s(id, value, valid_period) values ('generated-save_s-45', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-45', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-45', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-45', 0, '[20, 25)');
call oracle_save_s('generated-save_s-45');
call save_s('generated-save_s-45', 0, '[25, 55)');

\echo 'generated-save_s-46 - [osss]'
insert into s(id, value, valid_period) values ('generated-save_s-46', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-46', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-46', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-46', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-46');
call save_s('generated-save_s-46', 0, '[25, 55)');

\echo 'generated-save_s-47 - [cooo]'
insert into s(id, value, valid_period) values ('generated-save_s-47', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-47', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-47', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-47', 1, '[20, 30)');
call oracle_save_s('generated-save_s-47');
call save_s('generated-save_s-47', 0, '[25, 55)');

\echo 'generated-save_s-48 - [cooc]'
insert into s(id, value, valid_period) values ('generated-save_s-48', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-48', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-48', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-48', 0, '[20, 25)');
call oracle_save_s('generated-save_s-48');
call save_s('generated-save_s-48', 0, '[25, 55)');

\echo 'generated-save_s-49 - [coos]'
insert into s(id, value, valid_period) values ('generated-save_s-49', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-49', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-49', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-49', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-49');
call save_s('generated-save_s-49', 0, '[25, 55)');

\echo 'generated-save_s-50 - [cocs]'
insert into s(id, value, valid_period) values ('generated-save_s-50', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-50', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-50', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-50', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-50');
call save_s('generated-save_s-50', 0, '[25, 55)');

\echo 'generated-save_s-51 - [coso]'
insert into s(id, value, valid_period) values ('generated-save_s-51', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-51', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-51', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-51', 1, '[20, 30)');
call oracle_save_s('generated-save_s-51');
call save_s('generated-save_s-51', 0, '[25, 55)');

\echo 'generated-save_s-52 - [cosc]'
insert into s(id, value, valid_period) values ('generated-save_s-52', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-52', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-52', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-52', 0, '[20, 25)');
call oracle_save_s('generated-save_s-52');
call save_s('generated-save_s-52', 0, '[25, 55)');

\echo 'generated-save_s-53 - [coss]'
insert into s(id, value, valid_period) values ('generated-save_s-53', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-53', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-53', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-53', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-53');
call save_s('generated-save_s-53', 0, '[25, 55)');

\echo 'generated-save_s-54 - [csoo]'
insert into s(id, value, valid_period) values ('generated-save_s-54', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-54', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-54', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-54', 1, '[20, 30)');
call oracle_save_s('generated-save_s-54');
call save_s('generated-save_s-54', 0, '[25, 55)');

\echo 'generated-save_s-55 - [csoc]'
insert into s(id, value, valid_period) values ('generated-save_s-55', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-55', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-55', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-55', 0, '[20, 25)');
call oracle_save_s('generated-save_s-55');
call save_s('generated-save_s-55', 0, '[25, 55)');

\echo 'generated-save_s-56 - [csos]'
insert into s(id, value, valid_period) values ('generated-save_s-56', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-56', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-56', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-56', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-56');
call save_s('generated-save_s-56', 0, '[25, 55)');

\echo 'generated-save_s-57 - [cscs]'
insert into s(id, value, valid_period) values ('generated-save_s-57', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-57', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-57', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-57', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-57');
call save_s('generated-save_s-57', 0, '[25, 55)');

\echo 'generated-save_s-58 - [csso]'
insert into s(id, value, valid_period) values ('generated-save_s-58', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-58', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-58', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-58', 1, '[20, 30)');
call oracle_save_s('generated-save_s-58');
call save_s('generated-save_s-58', 0, '[25, 55)');

\echo 'generated-save_s-59 - [cssc]'
insert into s(id, value, valid_period) values ('generated-save_s-59', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-59', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-59', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-59', 0, '[20, 25)');
call oracle_save_s('generated-save_s-59');
call save_s('generated-save_s-59', 0, '[25, 55)');

\echo 'generated-save_s-60 - [csss]'
insert into s(id, value, valid_period) values ('generated-save_s-60', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-60', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-60', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-60', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-60');
call save_s('generated-save_s-60', 0, '[25, 55)');

\echo 'generated-save_s-61 - [sooo]'
insert into s(id, value, valid_period) values ('generated-save_s-61', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-61', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-61', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-61', 1, '[20, 30)');
call oracle_save_s('generated-save_s-61');
call save_s('generated-save_s-61', 0, '[25, 55)');

\echo 'generated-save_s-62 - [sooc]'
insert into s(id, value, valid_period) values ('generated-save_s-62', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-62', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-62', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-62', 0, '[20, 25)');
call oracle_save_s('generated-save_s-62');
call save_s('generated-save_s-62', 0, '[25, 55)');

\echo 'generated-save_s-63 - [soos]'
insert into s(id, value, valid_period) values ('generated-save_s-63', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-63', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-63', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-63', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-63');
call save_s('generated-save_s-63', 0, '[25, 55)');

\echo 'generated-save_s-64 - [socs]'
insert into s(id, value, valid_period) values ('generated-save_s-64', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-64', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-64', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-64', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-64');
call save_s('generated-save_s-64', 0, '[25, 55)');

\echo 'generated-save_s-65 - [soso]'
insert into s(id, value, valid_period) values ('generated-save_s-65', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-65', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-65', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-65', 1, '[20, 30)');
call oracle_save_s('generated-save_s-65');
call save_s('generated-save_s-65', 0, '[25, 55)');

\echo 'generated-save_s-66 - [sosc]'
insert into s(id, value, valid_period) values ('generated-save_s-66', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-66', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-66', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-66', 0, '[20, 25)');
call oracle_save_s('generated-save_s-66');
call save_s('generated-save_s-66', 0, '[25, 55)');

\echo 'generated-save_s-67 - [soss]'
insert into s(id, value, valid_period) values ('generated-save_s-67', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-67', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save_s-67', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-67', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-67');
call save_s('generated-save_s-67', 0, '[25, 55)');

\echo 'generated-save_s-68 - [scoo]'
insert into s(id, value, valid_period) values ('generated-save_s-68', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-68', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-68', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-68', 1, '[20, 30)');
call oracle_save_s('generated-save_s-68');
call save_s('generated-save_s-68', 0, '[25, 55)');

\echo 'generated-save_s-69 - [scoc]'
insert into s(id, value, valid_period) values ('generated-save_s-69', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-69', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-69', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-69', 0, '[20, 25)');
call oracle_save_s('generated-save_s-69');
call save_s('generated-save_s-69', 0, '[25, 55)');

\echo 'generated-save_s-70 - [scos]'
insert into s(id, value, valid_period) values ('generated-save_s-70', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-70', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-70', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-70', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-70');
call save_s('generated-save_s-70', 0, '[25, 55)');

\echo 'generated-save_s-71 - [sccs]'
insert into s(id, value, valid_period) values ('generated-save_s-71', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-71', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-71', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-71', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-71');
call save_s('generated-save_s-71', 0, '[25, 55)');

\echo 'generated-save_s-72 - [scso]'
insert into s(id, value, valid_period) values ('generated-save_s-72', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-72', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-72', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-72', 1, '[20, 30)');
call oracle_save_s('generated-save_s-72');
call save_s('generated-save_s-72', 0, '[25, 55)');

\echo 'generated-save_s-73 - [scsc]'
insert into s(id, value, valid_period) values ('generated-save_s-73', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-73', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-73', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-73', 0, '[20, 25)');
call oracle_save_s('generated-save_s-73');
call save_s('generated-save_s-73', 0, '[25, 55)');

\echo 'generated-save_s-74 - [scss]'
insert into s(id, value, valid_period) values ('generated-save_s-74', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-74', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save_s-74', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-74', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-74');
call save_s('generated-save_s-74', 0, '[25, 55)');

\echo 'generated-save_s-75 - [ssoo]'
insert into s(id, value, valid_period) values ('generated-save_s-75', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-75', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-75', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-75', 1, '[20, 30)');
call oracle_save_s('generated-save_s-75');
call save_s('generated-save_s-75', 0, '[25, 55)');

\echo 'generated-save_s-76 - [ssoc]'
insert into s(id, value, valid_period) values ('generated-save_s-76', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-76', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-76', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-76', 0, '[20, 25)');
call oracle_save_s('generated-save_s-76');
call save_s('generated-save_s-76', 0, '[25, 55)');

\echo 'generated-save_s-77 - [ssos]'
insert into s(id, value, valid_period) values ('generated-save_s-77', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-77', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-77', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save_s-77', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-77');
call save_s('generated-save_s-77', 0, '[25, 55)');

\echo 'generated-save_s-78 - [sscs]'
insert into s(id, value, valid_period) values ('generated-save_s-78', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-78', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-78', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save_s-78', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-78');
call save_s('generated-save_s-78', 0, '[25, 55)');

\echo 'generated-save_s-79 - [ssso]'
insert into s(id, value, valid_period) values ('generated-save_s-79', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-79', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-79', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-79', 1, '[20, 30)');
call oracle_save_s('generated-save_s-79');
call save_s('generated-save_s-79', 0, '[25, 55)');

\echo 'generated-save_s-80 - [sssc]'
insert into s(id, value, valid_period) values ('generated-save_s-80', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-80', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-80', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-80', 0, '[20, 25)');
call oracle_save_s('generated-save_s-80');
call save_s('generated-save_s-80', 0, '[25, 55)');

\echo 'generated-save_s-81 - [ssss]'
insert into s(id, value, valid_period) values ('generated-save_s-81', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save_s-81', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save_s-81', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save_s-81', 1, '[ 0,  5)');
call oracle_save_s('generated-save_s-81');
call save_s('generated-save_s-81', 0, '[25, 55)');

select id as "failed_tests"
  from (select distinct unnest(array[s.id, packed.id]) id
          from s
          full outer join packed using (id, value, valid_period)
         where s.id is null or packed.id is null) x
 where id is not null and id like 'generated-save_s-%'


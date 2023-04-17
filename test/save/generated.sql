\set QUIET 'on'

delete from s where id like 'generated-save-%';

\echo 'generated-save-01 - [----]'
call oracle_save_s('generated-save-01');
call save_s('generated-save-01', 0, '[25,55)');


\echo 'generated-save-02 - [---c]'
insert into s(id, value, valid_period) values ('generated-save-02', 0, '[20, 25)');
call oracle_save_s('generated-save-02');
call save_s('generated-save-02', 0, '[25,55)');


\echo 'generated-save-03 - [---s]'
insert into s(id, value, valid_period) values ('generated-save-03', 1, '[ 0,  5)');
call oracle_save_s('generated-save-03');
call save_s('generated-save-03', 0, '[25,55)');


\echo 'generated-save-04 - [---o]'
insert into s(id, value, valid_period) values ('generated-save-04', 1, '[20, 30)');
call oracle_save_s('generated-save-04');
call save_s('generated-save-04', 0, '[25,55)');


\echo 'generated-save-05 - [--cs]'
insert into s(id, value, valid_period) values ('generated-save-05', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-05', 1, '[ 0,  5)');
call oracle_save_s('generated-save-05');
call save_s('generated-save-05', 0, '[25,55)');


\echo 'generated-save-06 - [--sc]'
insert into s(id, value, valid_period) values ('generated-save-06', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-06', 0, '[20, 25)');
call oracle_save_s('generated-save-06');
call save_s('generated-save-06', 0, '[25,55)');


\echo 'generated-save-07 - [--ss]'
insert into s(id, value, valid_period) values ('generated-save-07', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-07', 1, '[ 0,  5)');
call oracle_save_s('generated-save-07');
call save_s('generated-save-07', 0, '[25,55)');


\echo 'generated-save-08 - [--so]'
insert into s(id, value, valid_period) values ('generated-save-08', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-08', 1, '[20, 30)');
call oracle_save_s('generated-save-08');
call save_s('generated-save-08', 0, '[25,55)');


\echo 'generated-save-09 - [--oc]'
insert into s(id, value, valid_period) values ('generated-save-09', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-09', 0, '[20, 25)');
call oracle_save_s('generated-save-09');
call save_s('generated-save-09', 0, '[25,55)');


\echo 'generated-save-10 - [--os]'
insert into s(id, value, valid_period) values ('generated-save-10', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-10', 1, '[ 0,  5)');
call oracle_save_s('generated-save-10');
call save_s('generated-save-10', 0, '[25,55)');


\echo 'generated-save-11 - [--oo]'
insert into s(id, value, valid_period) values ('generated-save-11', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-11', 1, '[20, 30)');
call oracle_save_s('generated-save-11');
call save_s('generated-save-11', 0, '[25,55)');


\echo 'generated-save-12 - [-ccs]'
insert into s(id, value, valid_period) values ('generated-save-12', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-12', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-12', 1, '[ 0,  5)');
call oracle_save_s('generated-save-12');
call save_s('generated-save-12', 0, '[25,55)');


\echo 'generated-save-13 - [-csc]'
insert into s(id, value, valid_period) values ('generated-save-13', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-13', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-13', 0, '[20, 25)');
call oracle_save_s('generated-save-13');
call save_s('generated-save-13', 0, '[25,55)');


\echo 'generated-save-14 - [-css]'
insert into s(id, value, valid_period) values ('generated-save-14', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-14', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-14', 1, '[ 0,  5)');
call oracle_save_s('generated-save-14');
call save_s('generated-save-14', 0, '[25,55)');


\echo 'generated-save-15 - [-cso]'
insert into s(id, value, valid_period) values ('generated-save-15', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-15', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-15', 1, '[20, 30)');
call oracle_save_s('generated-save-15');
call save_s('generated-save-15', 0, '[25,55)');


\echo 'generated-save-16 - [-coc]'
insert into s(id, value, valid_period) values ('generated-save-16', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-16', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-16', 0, '[20, 25)');
call oracle_save_s('generated-save-16');
call save_s('generated-save-16', 0, '[25,55)');


\echo 'generated-save-17 - [-cos]'
insert into s(id, value, valid_period) values ('generated-save-17', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-17', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-17', 1, '[ 0,  5)');
call oracle_save_s('generated-save-17');
call save_s('generated-save-17', 0, '[25,55)');


\echo 'generated-save-18 - [-coo]'
insert into s(id, value, valid_period) values ('generated-save-18', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-18', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-18', 1, '[20, 30)');
call oracle_save_s('generated-save-18');
call save_s('generated-save-18', 0, '[25,55)');


\echo 'generated-save-19 - [-scs]'
insert into s(id, value, valid_period) values ('generated-save-19', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-19', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-19', 1, '[ 0,  5)');
call oracle_save_s('generated-save-19');
call save_s('generated-save-19', 0, '[25,55)');


\echo 'generated-save-20 - [-ssc]'
insert into s(id, value, valid_period) values ('generated-save-20', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-20', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-20', 0, '[20, 25)');
call oracle_save_s('generated-save-20');
call save_s('generated-save-20', 0, '[25,55)');


\echo 'generated-save-21 - [-sss]'
insert into s(id, value, valid_period) values ('generated-save-21', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-21', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-21', 1, '[ 0,  5)');
call oracle_save_s('generated-save-21');
call save_s('generated-save-21', 0, '[25,55)');


\echo 'generated-save-22 - [-sso]'
insert into s(id, value, valid_period) values ('generated-save-22', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-22', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-22', 1, '[20, 30)');
call oracle_save_s('generated-save-22');
call save_s('generated-save-22', 0, '[25,55)');


\echo 'generated-save-23 - [-soc]'
insert into s(id, value, valid_period) values ('generated-save-23', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-23', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-23', 0, '[20, 25)');
call oracle_save_s('generated-save-23');
call save_s('generated-save-23', 0, '[25,55)');


\echo 'generated-save-24 - [-sos]'
insert into s(id, value, valid_period) values ('generated-save-24', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-24', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-24', 1, '[ 0,  5)');
call oracle_save_s('generated-save-24');
call save_s('generated-save-24', 0, '[25,55)');


\echo 'generated-save-25 - [-soo]'
insert into s(id, value, valid_period) values ('generated-save-25', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-25', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-25', 1, '[20, 30)');
call oracle_save_s('generated-save-25');
call save_s('generated-save-25', 0, '[25,55)');


\echo 'generated-save-26 - [-ocs]'
insert into s(id, value, valid_period) values ('generated-save-26', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-26', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-26', 1, '[ 0,  5)');
call oracle_save_s('generated-save-26');
call save_s('generated-save-26', 0, '[25,55)');


\echo 'generated-save-27 - [-osc]'
insert into s(id, value, valid_period) values ('generated-save-27', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-27', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-27', 0, '[20, 25)');
call oracle_save_s('generated-save-27');
call save_s('generated-save-27', 0, '[25,55)');


\echo 'generated-save-28 - [-oss]'
insert into s(id, value, valid_period) values ('generated-save-28', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-28', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-28', 1, '[ 0,  5)');
call oracle_save_s('generated-save-28');
call save_s('generated-save-28', 0, '[25,55)');


\echo 'generated-save-29 - [-oso]'
insert into s(id, value, valid_period) values ('generated-save-29', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-29', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-29', 1, '[20, 30)');
call oracle_save_s('generated-save-29');
call save_s('generated-save-29', 0, '[25,55)');


\echo 'generated-save-30 - [-ooc]'
insert into s(id, value, valid_period) values ('generated-save-30', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-30', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-30', 0, '[20, 25)');
call oracle_save_s('generated-save-30');
call save_s('generated-save-30', 0, '[25,55)');


\echo 'generated-save-31 - [-oos]'
insert into s(id, value, valid_period) values ('generated-save-31', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-31', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-31', 1, '[ 0,  5)');
call oracle_save_s('generated-save-31');
call save_s('generated-save-31', 0, '[25,55)');


\echo 'generated-save-32 - [-ooo]'
insert into s(id, value, valid_period) values ('generated-save-32', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-32', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-32', 1, '[20, 30)');
call oracle_save_s('generated-save-32');
call save_s('generated-save-32', 0, '[25,55)');


\echo 'generated-save-33 - [cssc]'
insert into s(id, value, valid_period) values ('generated-save-33', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-33', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-33', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-33', 0, '[20, 25)');
call oracle_save_s('generated-save-33');
call save_s('generated-save-33', 0, '[25,55)');


\echo 'generated-save-34 - [cosc]'
insert into s(id, value, valid_period) values ('generated-save-34', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-34', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-34', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-34', 0, '[20, 25)');
call oracle_save_s('generated-save-34');
call save_s('generated-save-34', 0, '[25,55)');


\echo 'generated-save-35 - [scsc]'
insert into s(id, value, valid_period) values ('generated-save-35', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-35', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-35', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-35', 0, '[20, 25)');
call oracle_save_s('generated-save-35');
call save_s('generated-save-35', 0, '[25,55)');


\echo 'generated-save-36 - [sssc]'
insert into s(id, value, valid_period) values ('generated-save-36', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-36', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-36', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-36', 0, '[20, 25)');
call oracle_save_s('generated-save-36');
call save_s('generated-save-36', 0, '[25,55)');


\echo 'generated-save-37 - [sosc]'
insert into s(id, value, valid_period) values ('generated-save-37', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-37', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-37', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-37', 0, '[20, 25)');
call oracle_save_s('generated-save-37');
call save_s('generated-save-37', 0, '[25,55)');


\echo 'generated-save-38 - [ossc]'
insert into s(id, value, valid_period) values ('generated-save-38', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-38', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-38', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-38', 0, '[20, 25)');
call oracle_save_s('generated-save-38');
call save_s('generated-save-38', 0, '[25,55)');


\echo 'generated-save-39 - [oosc]'
insert into s(id, value, valid_period) values ('generated-save-39', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-39', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-39', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-39', 0, '[20, 25)');
call oracle_save_s('generated-save-39');
call save_s('generated-save-39', 0, '[25,55)');


\echo 'generated-save-40 - [csoc]'
insert into s(id, value, valid_period) values ('generated-save-40', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-40', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-40', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-40', 0, '[20, 25)');
call oracle_save_s('generated-save-40');
call save_s('generated-save-40', 0, '[25,55)');


\echo 'generated-save-41 - [cooc]'
insert into s(id, value, valid_period) values ('generated-save-41', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-41', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-41', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-41', 0, '[20, 25)');
call oracle_save_s('generated-save-41');
call save_s('generated-save-41', 0, '[25,55)');


\echo 'generated-save-42 - [scoc]'
insert into s(id, value, valid_period) values ('generated-save-42', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-42', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-42', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-42', 0, '[20, 25)');
call oracle_save_s('generated-save-42');
call save_s('generated-save-42', 0, '[25,55)');


\echo 'generated-save-43 - [ssoc]'
insert into s(id, value, valid_period) values ('generated-save-43', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-43', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-43', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-43', 0, '[20, 25)');
call oracle_save_s('generated-save-43');
call save_s('generated-save-43', 0, '[25,55)');


\echo 'generated-save-44 - [sooc]'
insert into s(id, value, valid_period) values ('generated-save-44', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-44', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-44', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-44', 0, '[20, 25)');
call oracle_save_s('generated-save-44');
call save_s('generated-save-44', 0, '[25,55)');


\echo 'generated-save-45 - [osoc]'
insert into s(id, value, valid_period) values ('generated-save-45', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-45', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-45', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-45', 0, '[20, 25)');
call oracle_save_s('generated-save-45');
call save_s('generated-save-45', 0, '[25,55)');


\echo 'generated-save-46 - [oooc]'
insert into s(id, value, valid_period) values ('generated-save-46', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-46', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-46', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-46', 0, '[20, 25)');
call oracle_save_s('generated-save-46');
call save_s('generated-save-46', 0, '[25,55)');


\echo 'generated-save-47 - [cscs]'
insert into s(id, value, valid_period) values ('generated-save-47', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-47', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-47', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-47', 1, '[ 0,  5)');
call oracle_save_s('generated-save-47');
call save_s('generated-save-47', 0, '[25,55)');


\echo 'generated-save-48 - [cocs]'
insert into s(id, value, valid_period) values ('generated-save-48', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-48', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-48', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-48', 1, '[ 0,  5)');
call oracle_save_s('generated-save-48');
call save_s('generated-save-48', 0, '[25,55)');


\echo 'generated-save-49 - [sccs]'
insert into s(id, value, valid_period) values ('generated-save-49', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-49', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-49', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-49', 1, '[ 0,  5)');
call oracle_save_s('generated-save-49');
call save_s('generated-save-49', 0, '[25,55)');


\echo 'generated-save-50 - [sscs]'
insert into s(id, value, valid_period) values ('generated-save-50', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-50', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-50', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-50', 1, '[ 0,  5)');
call oracle_save_s('generated-save-50');
call save_s('generated-save-50', 0, '[25,55)');


\echo 'generated-save-51 - [socs]'
insert into s(id, value, valid_period) values ('generated-save-51', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-51', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-51', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-51', 1, '[ 0,  5)');
call oracle_save_s('generated-save-51');
call save_s('generated-save-51', 0, '[25,55)');


\echo 'generated-save-52 - [oscs]'
insert into s(id, value, valid_period) values ('generated-save-52', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-52', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-52', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-52', 1, '[ 0,  5)');
call oracle_save_s('generated-save-52');
call save_s('generated-save-52', 0, '[25,55)');


\echo 'generated-save-53 - [oocs]'
insert into s(id, value, valid_period) values ('generated-save-53', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-53', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-53', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-save-53', 1, '[ 0,  5)');
call oracle_save_s('generated-save-53');
call save_s('generated-save-53', 0, '[25,55)');


\echo 'generated-save-54 - [csss]'
insert into s(id, value, valid_period) values ('generated-save-54', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-54', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-54', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-54', 1, '[ 0,  5)');
call oracle_save_s('generated-save-54');
call save_s('generated-save-54', 0, '[25,55)');


\echo 'generated-save-55 - [coss]'
insert into s(id, value, valid_period) values ('generated-save-55', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-55', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-55', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-55', 1, '[ 0,  5)');
call oracle_save_s('generated-save-55');
call save_s('generated-save-55', 0, '[25,55)');


\echo 'generated-save-56 - [scss]'
insert into s(id, value, valid_period) values ('generated-save-56', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-56', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-56', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-56', 1, '[ 0,  5)');
call oracle_save_s('generated-save-56');
call save_s('generated-save-56', 0, '[25,55)');


\echo 'generated-save-57 - [ssss]'
insert into s(id, value, valid_period) values ('generated-save-57', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-57', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-57', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-57', 1, '[ 0,  5)');
call oracle_save_s('generated-save-57');
call save_s('generated-save-57', 0, '[25,55)');


\echo 'generated-save-58 - [soss]'
insert into s(id, value, valid_period) values ('generated-save-58', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-58', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-58', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-58', 1, '[ 0,  5)');
call oracle_save_s('generated-save-58');
call save_s('generated-save-58', 0, '[25,55)');


\echo 'generated-save-59 - [osss]'
insert into s(id, value, valid_period) values ('generated-save-59', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-59', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-59', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-59', 1, '[ 0,  5)');
call oracle_save_s('generated-save-59');
call save_s('generated-save-59', 0, '[25,55)');


\echo 'generated-save-60 - [ooss]'
insert into s(id, value, valid_period) values ('generated-save-60', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-60', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-60', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-60', 1, '[ 0,  5)');
call oracle_save_s('generated-save-60');
call save_s('generated-save-60', 0, '[25,55)');


\echo 'generated-save-61 - [csos]'
insert into s(id, value, valid_period) values ('generated-save-61', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-61', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-61', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-61', 1, '[ 0,  5)');
call oracle_save_s('generated-save-61');
call save_s('generated-save-61', 0, '[25,55)');


\echo 'generated-save-62 - [coos]'
insert into s(id, value, valid_period) values ('generated-save-62', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-62', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-62', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-62', 1, '[ 0,  5)');
call oracle_save_s('generated-save-62');
call save_s('generated-save-62', 0, '[25,55)');


\echo 'generated-save-63 - [scos]'
insert into s(id, value, valid_period) values ('generated-save-63', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-63', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-63', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-63', 1, '[ 0,  5)');
call oracle_save_s('generated-save-63');
call save_s('generated-save-63', 0, '[25,55)');


\echo 'generated-save-64 - [ssos]'
insert into s(id, value, valid_period) values ('generated-save-64', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-64', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-64', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-64', 1, '[ 0,  5)');
call oracle_save_s('generated-save-64');
call save_s('generated-save-64', 0, '[25,55)');


\echo 'generated-save-65 - [soos]'
insert into s(id, value, valid_period) values ('generated-save-65', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-65', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-65', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-65', 1, '[ 0,  5)');
call oracle_save_s('generated-save-65');
call save_s('generated-save-65', 0, '[25,55)');


\echo 'generated-save-66 - [osos]'
insert into s(id, value, valid_period) values ('generated-save-66', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-66', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-66', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-66', 1, '[ 0,  5)');
call oracle_save_s('generated-save-66');
call save_s('generated-save-66', 0, '[25,55)');


\echo 'generated-save-67 - [ooos]'
insert into s(id, value, valid_period) values ('generated-save-67', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-67', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-67', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-67', 1, '[ 0,  5)');
call oracle_save_s('generated-save-67');
call save_s('generated-save-67', 0, '[25,55)');


\echo 'generated-save-68 - [csso]'
insert into s(id, value, valid_period) values ('generated-save-68', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-68', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-68', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-68', 1, '[20, 30)');
call oracle_save_s('generated-save-68');
call save_s('generated-save-68', 0, '[25,55)');


\echo 'generated-save-69 - [coso]'
insert into s(id, value, valid_period) values ('generated-save-69', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-69', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-69', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-69', 1, '[20, 30)');
call oracle_save_s('generated-save-69');
call save_s('generated-save-69', 0, '[25,55)');


\echo 'generated-save-70 - [scso]'
insert into s(id, value, valid_period) values ('generated-save-70', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-70', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-70', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-70', 1, '[20, 30)');
call oracle_save_s('generated-save-70');
call save_s('generated-save-70', 0, '[25,55)');


\echo 'generated-save-71 - [ssso]'
insert into s(id, value, valid_period) values ('generated-save-71', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-71', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-71', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-71', 1, '[20, 30)');
call oracle_save_s('generated-save-71');
call save_s('generated-save-71', 0, '[25,55)');


\echo 'generated-save-72 - [soso]'
insert into s(id, value, valid_period) values ('generated-save-72', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-72', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-72', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-72', 1, '[20, 30)');
call oracle_save_s('generated-save-72');
call save_s('generated-save-72', 0, '[25,55)');


\echo 'generated-save-73 - [osso]'
insert into s(id, value, valid_period) values ('generated-save-73', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-73', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-73', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-73', 1, '[20, 30)');
call oracle_save_s('generated-save-73');
call save_s('generated-save-73', 0, '[25,55)');


\echo 'generated-save-74 - [ooso]'
insert into s(id, value, valid_period) values ('generated-save-74', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-74', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-74', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-save-74', 1, '[20, 30)');
call oracle_save_s('generated-save-74');
call save_s('generated-save-74', 0, '[25,55)');


\echo 'generated-save-75 - [csoo]'
insert into s(id, value, valid_period) values ('generated-save-75', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-75', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-75', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-75', 1, '[20, 30)');
call oracle_save_s('generated-save-75');
call save_s('generated-save-75', 0, '[25,55)');


\echo 'generated-save-76 - [cooo]'
insert into s(id, value, valid_period) values ('generated-save-76', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-76', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-76', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-76', 1, '[20, 30)');
call oracle_save_s('generated-save-76');
call save_s('generated-save-76', 0, '[25,55)');


\echo 'generated-save-77 - [scoo]'
insert into s(id, value, valid_period) values ('generated-save-77', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-77', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-save-77', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-77', 1, '[20, 30)');
call oracle_save_s('generated-save-77');
call save_s('generated-save-77', 0, '[25,55)');


\echo 'generated-save-78 - [ssoo]'
insert into s(id, value, valid_period) values ('generated-save-78', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-78', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-78', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-78', 1, '[20, 30)');
call oracle_save_s('generated-save-78');
call save_s('generated-save-78', 0, '[25,55)');


\echo 'generated-save-79 - [sooo]'
insert into s(id, value, valid_period) values ('generated-save-79', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-save-79', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-79', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-79', 1, '[20, 30)');
call oracle_save_s('generated-save-79');
call save_s('generated-save-79', 0, '[25,55)');


\echo 'generated-save-80 - [osoo]'
insert into s(id, value, valid_period) values ('generated-save-80', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-80', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-save-80', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-80', 1, '[20, 30)');
call oracle_save_s('generated-save-80');
call save_s('generated-save-80', 0, '[25,55)');


\echo 'generated-save-81 - [oooo]'
insert into s(id, value, valid_period) values ('generated-save-81', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-save-81', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-save-81', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-save-81', 1, '[20, 30)');
call oracle_save_s('generated-save-81');
call save_s('generated-save-81', 0, '[25,55)');


select id as "failed_tests"
  from (select distinct unnest(array[s.id, packed.id]) id
          from s
          full outer join packed using (id, value, valid_period)
         where s.id is null or packed.id is null) x
 where id is not null and id like 'generated-save-%'


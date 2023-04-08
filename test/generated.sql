\set QUIET 'on'

truncate s;

\echo 'generated-01 - [----]'
call unpack('generated-01');
call oracle_save_s('generated-01');
call pack('generated-01');
call save_s('generated-01', 0, '[25, 55)');

\echo 'generated-02 - [---o]'
insert into s(id, value, valid_period) values ('generated-02', 1, '[20, 30)');
call unpack('generated-02');
call oracle_save_s('generated-02');
call pack('generated-02');
call save_s('generated-02', 0, '[25, 55)');

\echo 'generated-03 - [---c]'
insert into s(id, value, valid_period) values ('generated-03', 0, '[20, 25)');
call unpack('generated-03');
call oracle_save_s('generated-03');
call pack('generated-03');
call save_s('generated-03', 0, '[25, 55)');

\echo 'generated-04 - [---s]'
insert into s(id, value, valid_period) values ('generated-04', 1, '[ 0,  5)');
call unpack('generated-04');
call oracle_save_s('generated-04');
call pack('generated-04');
call save_s('generated-04', 0, '[25, 55)');

\echo 'generated-05 - [--oo]'
insert into s(id, value, valid_period) values ('generated-05', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-05', 1, '[20, 30)');
call unpack('generated-05');
call oracle_save_s('generated-05');
call pack('generated-05');
call save_s('generated-05', 0, '[25, 55)');

\echo 'generated-06 - [--oc]'
insert into s(id, value, valid_period) values ('generated-06', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-06', 0, '[20, 25)');
call unpack('generated-06');
call oracle_save_s('generated-06');
call pack('generated-06');
call save_s('generated-06', 0, '[25, 55)');

\echo 'generated-07 - [--os]'
insert into s(id, value, valid_period) values ('generated-07', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-07', 1, '[ 0,  5)');
call unpack('generated-07');
call oracle_save_s('generated-07');
call pack('generated-07');
call save_s('generated-07', 0, '[25, 55)');

\echo 'generated-08 - [--cs]'
insert into s(id, value, valid_period) values ('generated-08', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-08', 1, '[ 0,  5)');
call unpack('generated-08');
call oracle_save_s('generated-08');
call pack('generated-08');
call save_s('generated-08', 0, '[25, 55)');

\echo 'generated-09 - [--so]'
insert into s(id, value, valid_period) values ('generated-09', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-09', 1, '[20, 30)');
call unpack('generated-09');
call oracle_save_s('generated-09');
call pack('generated-09');
call save_s('generated-09', 0, '[25, 55)');

\echo 'generated-10 - [--sc]'
insert into s(id, value, valid_period) values ('generated-10', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-10', 0, '[20, 25)');
call unpack('generated-10');
call oracle_save_s('generated-10');
call pack('generated-10');
call save_s('generated-10', 0, '[25, 55)');

\echo 'generated-11 - [--ss]'
insert into s(id, value, valid_period) values ('generated-11', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-11', 1, '[ 0,  5)');
call unpack('generated-11');
call oracle_save_s('generated-11');
call pack('generated-11');
call save_s('generated-11', 0, '[25, 55)');

\echo 'generated-12 - [-ooo]'
insert into s(id, value, valid_period) values ('generated-12', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-12', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-12', 1, '[20, 30)');
call unpack('generated-12');
call oracle_save_s('generated-12');
call pack('generated-12');
call save_s('generated-12', 0, '[25, 55)');

\echo 'generated-13 - [-coo]'
insert into s(id, value, valid_period) values ('generated-13', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-13', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-13', 1, '[20, 30)');
call unpack('generated-13');
call oracle_save_s('generated-13');
call pack('generated-13');
call save_s('generated-13', 0, '[25, 55)');

\echo 'generated-14 - [-soo]'
insert into s(id, value, valid_period) values ('generated-14', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-14', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-14', 1, '[20, 30)');
call unpack('generated-14');
call oracle_save_s('generated-14');
call pack('generated-14');
call save_s('generated-14', 0, '[25, 55)');

\echo 'generated-15 - [-ooc]'
insert into s(id, value, valid_period) values ('generated-15', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-15', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-15', 0, '[20, 25)');
call unpack('generated-15');
call oracle_save_s('generated-15');
call pack('generated-15');
call save_s('generated-15', 0, '[25, 55)');

\echo 'generated-16 - [-coc]'
insert into s(id, value, valid_period) values ('generated-16', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-16', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-16', 0, '[20, 25)');
call unpack('generated-16');
call oracle_save_s('generated-16');
call pack('generated-16');
call save_s('generated-16', 0, '[25, 55)');

\echo 'generated-17 - [-soc]'
insert into s(id, value, valid_period) values ('generated-17', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-17', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-17', 0, '[20, 25)');
call unpack('generated-17');
call oracle_save_s('generated-17');
call pack('generated-17');
call save_s('generated-17', 0, '[25, 55)');

\echo 'generated-18 - [-oos]'
insert into s(id, value, valid_period) values ('generated-18', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-18', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-18', 1, '[ 0,  5)');
call unpack('generated-18');
call oracle_save_s('generated-18');
call pack('generated-18');
call save_s('generated-18', 0, '[25, 55)');

\echo 'generated-19 - [-cos]'
insert into s(id, value, valid_period) values ('generated-19', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-19', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-19', 1, '[ 0,  5)');
call unpack('generated-19');
call oracle_save_s('generated-19');
call pack('generated-19');
call save_s('generated-19', 0, '[25, 55)');

\echo 'generated-20 - [-sos]'
insert into s(id, value, valid_period) values ('generated-20', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-20', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-20', 1, '[ 0,  5)');
call unpack('generated-20');
call oracle_save_s('generated-20');
call pack('generated-20');
call save_s('generated-20', 0, '[25, 55)');

\echo 'generated-21 - [-ocs]'
insert into s(id, value, valid_period) values ('generated-21', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-21', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-21', 1, '[ 0,  5)');
call unpack('generated-21');
call oracle_save_s('generated-21');
call pack('generated-21');
call save_s('generated-21', 0, '[25, 55)');

\echo 'generated-22 - [-ccs]'
insert into s(id, value, valid_period) values ('generated-22', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-22', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-22', 1, '[ 0,  5)');
call unpack('generated-22');
call oracle_save_s('generated-22');
call pack('generated-22');
call save_s('generated-22', 0, '[25, 55)');

\echo 'generated-23 - [-scs]'
insert into s(id, value, valid_period) values ('generated-23', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-23', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-23', 1, '[ 0,  5)');
call unpack('generated-23');
call oracle_save_s('generated-23');
call pack('generated-23');
call save_s('generated-23', 0, '[25, 55)');

\echo 'generated-24 - [-oso]'
insert into s(id, value, valid_period) values ('generated-24', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-24', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-24', 1, '[20, 30)');
call unpack('generated-24');
call oracle_save_s('generated-24');
call pack('generated-24');
call save_s('generated-24', 0, '[25, 55)');

\echo 'generated-25 - [-cso]'
insert into s(id, value, valid_period) values ('generated-25', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-25', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-25', 1, '[20, 30)');
call unpack('generated-25');
call oracle_save_s('generated-25');
call pack('generated-25');
call save_s('generated-25', 0, '[25, 55)');

\echo 'generated-26 - [-sso]'
insert into s(id, value, valid_period) values ('generated-26', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-26', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-26', 1, '[20, 30)');
call unpack('generated-26');
call oracle_save_s('generated-26');
call pack('generated-26');
call save_s('generated-26', 0, '[25, 55)');

\echo 'generated-27 - [-osc]'
insert into s(id, value, valid_period) values ('generated-27', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-27', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-27', 0, '[20, 25)');
call unpack('generated-27');
call oracle_save_s('generated-27');
call pack('generated-27');
call save_s('generated-27', 0, '[25, 55)');

\echo 'generated-28 - [-csc]'
insert into s(id, value, valid_period) values ('generated-28', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-28', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-28', 0, '[20, 25)');
call unpack('generated-28');
call oracle_save_s('generated-28');
call pack('generated-28');
call save_s('generated-28', 0, '[25, 55)');

\echo 'generated-29 - [-ssc]'
insert into s(id, value, valid_period) values ('generated-29', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-29', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-29', 0, '[20, 25)');
call unpack('generated-29');
call oracle_save_s('generated-29');
call pack('generated-29');
call save_s('generated-29', 0, '[25, 55)');

\echo 'generated-30 - [-oss]'
insert into s(id, value, valid_period) values ('generated-30', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-30', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-30', 1, '[ 0,  5)');
call unpack('generated-30');
call oracle_save_s('generated-30');
call pack('generated-30');
call save_s('generated-30', 0, '[25, 55)');

\echo 'generated-31 - [-css]'
insert into s(id, value, valid_period) values ('generated-31', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-31', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-31', 1, '[ 0,  5)');
call unpack('generated-31');
call oracle_save_s('generated-31');
call pack('generated-31');
call save_s('generated-31', 0, '[25, 55)');

\echo 'generated-32 - [-sss]'
insert into s(id, value, valid_period) values ('generated-32', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-32', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-32', 1, '[ 0,  5)');
call unpack('generated-32');
call oracle_save_s('generated-32');
call pack('generated-32');
call save_s('generated-32', 0, '[25, 55)');

\echo 'generated-33 - [oooo]'
insert into s(id, value, valid_period) values ('generated-33', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-33', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-33', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-33', 1, '[20, 30)');
call unpack('generated-33');
call oracle_save_s('generated-33');
call pack('generated-33');
call save_s('generated-33', 0, '[25, 55)');

\echo 'generated-34 - [oooc]'
insert into s(id, value, valid_period) values ('generated-34', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-34', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-34', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-34', 0, '[20, 25)');
call unpack('generated-34');
call oracle_save_s('generated-34');
call pack('generated-34');
call save_s('generated-34', 0, '[25, 55)');

\echo 'generated-35 - [ooos]'
insert into s(id, value, valid_period) values ('generated-35', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-35', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-35', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-35', 1, '[ 0,  5)');
call unpack('generated-35');
call oracle_save_s('generated-35');
call pack('generated-35');
call save_s('generated-35', 0, '[25, 55)');

\echo 'generated-36 - [oocs]'
insert into s(id, value, valid_period) values ('generated-36', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-36', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-36', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-36', 1, '[ 0,  5)');
call unpack('generated-36');
call oracle_save_s('generated-36');
call pack('generated-36');
call save_s('generated-36', 0, '[25, 55)');

\echo 'generated-37 - [ooso]'
insert into s(id, value, valid_period) values ('generated-37', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-37', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-37', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-37', 1, '[20, 30)');
call unpack('generated-37');
call oracle_save_s('generated-37');
call pack('generated-37');
call save_s('generated-37', 0, '[25, 55)');

\echo 'generated-38 - [oosc]'
insert into s(id, value, valid_period) values ('generated-38', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-38', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-38', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-38', 0, '[20, 25)');
call unpack('generated-38');
call oracle_save_s('generated-38');
call pack('generated-38');
call save_s('generated-38', 0, '[25, 55)');

\echo 'generated-39 - [ooss]'
insert into s(id, value, valid_period) values ('generated-39', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-39', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-39', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-39', 1, '[ 0,  5)');
call unpack('generated-39');
call oracle_save_s('generated-39');
call pack('generated-39');
call save_s('generated-39', 0, '[25, 55)');

\echo 'generated-40 - [osoo]'
insert into s(id, value, valid_period) values ('generated-40', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-40', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-40', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-40', 1, '[20, 30)');
call unpack('generated-40');
call oracle_save_s('generated-40');
call pack('generated-40');
call save_s('generated-40', 0, '[25, 55)');

\echo 'generated-41 - [osoc]'
insert into s(id, value, valid_period) values ('generated-41', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-41', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-41', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-41', 0, '[20, 25)');
call unpack('generated-41');
call oracle_save_s('generated-41');
call pack('generated-41');
call save_s('generated-41', 0, '[25, 55)');

\echo 'generated-42 - [osos]'
insert into s(id, value, valid_period) values ('generated-42', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-42', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-42', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-42', 1, '[ 0,  5)');
call unpack('generated-42');
call oracle_save_s('generated-42');
call pack('generated-42');
call save_s('generated-42', 0, '[25, 55)');

\echo 'generated-43 - [oscs]'
insert into s(id, value, valid_period) values ('generated-43', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-43', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-43', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-43', 1, '[ 0,  5)');
call unpack('generated-43');
call oracle_save_s('generated-43');
call pack('generated-43');
call save_s('generated-43', 0, '[25, 55)');

\echo 'generated-44 - [osso]'
insert into s(id, value, valid_period) values ('generated-44', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-44', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-44', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-44', 1, '[20, 30)');
call unpack('generated-44');
call oracle_save_s('generated-44');
call pack('generated-44');
call save_s('generated-44', 0, '[25, 55)');

\echo 'generated-45 - [ossc]'
insert into s(id, value, valid_period) values ('generated-45', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-45', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-45', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-45', 0, '[20, 25)');
call unpack('generated-45');
call oracle_save_s('generated-45');
call pack('generated-45');
call save_s('generated-45', 0, '[25, 55)');

\echo 'generated-46 - [osss]'
insert into s(id, value, valid_period) values ('generated-46', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-46', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-46', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-46', 1, '[ 0,  5)');
call unpack('generated-46');
call oracle_save_s('generated-46');
call pack('generated-46');
call save_s('generated-46', 0, '[25, 55)');

\echo 'generated-47 - [cooo]'
insert into s(id, value, valid_period) values ('generated-47', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-47', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-47', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-47', 1, '[20, 30)');
call unpack('generated-47');
call oracle_save_s('generated-47');
call pack('generated-47');
call save_s('generated-47', 0, '[25, 55)');

\echo 'generated-48 - [cooc]'
insert into s(id, value, valid_period) values ('generated-48', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-48', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-48', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-48', 0, '[20, 25)');
call unpack('generated-48');
call oracle_save_s('generated-48');
call pack('generated-48');
call save_s('generated-48', 0, '[25, 55)');

\echo 'generated-49 - [coos]'
insert into s(id, value, valid_period) values ('generated-49', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-49', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-49', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-49', 1, '[ 0,  5)');
call unpack('generated-49');
call oracle_save_s('generated-49');
call pack('generated-49');
call save_s('generated-49', 0, '[25, 55)');

\echo 'generated-50 - [cocs]'
insert into s(id, value, valid_period) values ('generated-50', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-50', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-50', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-50', 1, '[ 0,  5)');
call unpack('generated-50');
call oracle_save_s('generated-50');
call pack('generated-50');
call save_s('generated-50', 0, '[25, 55)');

\echo 'generated-51 - [coso]'
insert into s(id, value, valid_period) values ('generated-51', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-51', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-51', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-51', 1, '[20, 30)');
call unpack('generated-51');
call oracle_save_s('generated-51');
call pack('generated-51');
call save_s('generated-51', 0, '[25, 55)');

\echo 'generated-52 - [cosc]'
insert into s(id, value, valid_period) values ('generated-52', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-52', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-52', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-52', 0, '[20, 25)');
call unpack('generated-52');
call oracle_save_s('generated-52');
call pack('generated-52');
call save_s('generated-52', 0, '[25, 55)');

\echo 'generated-53 - [coss]'
insert into s(id, value, valid_period) values ('generated-53', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-53', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-53', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-53', 1, '[ 0,  5)');
call unpack('generated-53');
call oracle_save_s('generated-53');
call pack('generated-53');
call save_s('generated-53', 0, '[25, 55)');

\echo 'generated-54 - [csoo]'
insert into s(id, value, valid_period) values ('generated-54', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-54', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-54', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-54', 1, '[20, 30)');
call unpack('generated-54');
call oracle_save_s('generated-54');
call pack('generated-54');
call save_s('generated-54', 0, '[25, 55)');

\echo 'generated-55 - [csoc]'
insert into s(id, value, valid_period) values ('generated-55', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-55', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-55', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-55', 0, '[20, 25)');
call unpack('generated-55');
call oracle_save_s('generated-55');
call pack('generated-55');
call save_s('generated-55', 0, '[25, 55)');

\echo 'generated-56 - [csos]'
insert into s(id, value, valid_period) values ('generated-56', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-56', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-56', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-56', 1, '[ 0,  5)');
call unpack('generated-56');
call oracle_save_s('generated-56');
call pack('generated-56');
call save_s('generated-56', 0, '[25, 55)');

\echo 'generated-57 - [cscs]'
insert into s(id, value, valid_period) values ('generated-57', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-57', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-57', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-57', 1, '[ 0,  5)');
call unpack('generated-57');
call oracle_save_s('generated-57');
call pack('generated-57');
call save_s('generated-57', 0, '[25, 55)');

\echo 'generated-58 - [csso]'
insert into s(id, value, valid_period) values ('generated-58', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-58', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-58', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-58', 1, '[20, 30)');
call unpack('generated-58');
call oracle_save_s('generated-58');
call pack('generated-58');
call save_s('generated-58', 0, '[25, 55)');

\echo 'generated-59 - [cssc]'
insert into s(id, value, valid_period) values ('generated-59', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-59', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-59', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-59', 0, '[20, 25)');
call unpack('generated-59');
call oracle_save_s('generated-59');
call pack('generated-59');
call save_s('generated-59', 0, '[25, 55)');

\echo 'generated-60 - [csss]'
insert into s(id, value, valid_period) values ('generated-60', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-60', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-60', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-60', 1, '[ 0,  5)');
call unpack('generated-60');
call oracle_save_s('generated-60');
call pack('generated-60');
call save_s('generated-60', 0, '[25, 55)');

\echo 'generated-61 - [sooo]'
insert into s(id, value, valid_period) values ('generated-61', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-61', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-61', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-61', 1, '[20, 30)');
call unpack('generated-61');
call oracle_save_s('generated-61');
call pack('generated-61');
call save_s('generated-61', 0, '[25, 55)');

\echo 'generated-62 - [sooc]'
insert into s(id, value, valid_period) values ('generated-62', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-62', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-62', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-62', 0, '[20, 25)');
call unpack('generated-62');
call oracle_save_s('generated-62');
call pack('generated-62');
call save_s('generated-62', 0, '[25, 55)');

\echo 'generated-63 - [soos]'
insert into s(id, value, valid_period) values ('generated-63', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-63', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-63', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-63', 1, '[ 0,  5)');
call unpack('generated-63');
call oracle_save_s('generated-63');
call pack('generated-63');
call save_s('generated-63', 0, '[25, 55)');

\echo 'generated-64 - [socs]'
insert into s(id, value, valid_period) values ('generated-64', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-64', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-64', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-64', 1, '[ 0,  5)');
call unpack('generated-64');
call oracle_save_s('generated-64');
call pack('generated-64');
call save_s('generated-64', 0, '[25, 55)');

\echo 'generated-65 - [soso]'
insert into s(id, value, valid_period) values ('generated-65', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-65', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-65', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-65', 1, '[20, 30)');
call unpack('generated-65');
call oracle_save_s('generated-65');
call pack('generated-65');
call save_s('generated-65', 0, '[25, 55)');

\echo 'generated-66 - [sosc]'
insert into s(id, value, valid_period) values ('generated-66', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-66', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-66', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-66', 0, '[20, 25)');
call unpack('generated-66');
call oracle_save_s('generated-66');
call pack('generated-66');
call save_s('generated-66', 0, '[25, 55)');

\echo 'generated-67 - [soss]'
insert into s(id, value, valid_period) values ('generated-67', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-67', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-67', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-67', 1, '[ 0,  5)');
call unpack('generated-67');
call oracle_save_s('generated-67');
call pack('generated-67');
call save_s('generated-67', 0, '[25, 55)');

\echo 'generated-68 - [scoo]'
insert into s(id, value, valid_period) values ('generated-68', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-68', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-68', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-68', 1, '[20, 30)');
call unpack('generated-68');
call oracle_save_s('generated-68');
call pack('generated-68');
call save_s('generated-68', 0, '[25, 55)');

\echo 'generated-69 - [scoc]'
insert into s(id, value, valid_period) values ('generated-69', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-69', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-69', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-69', 0, '[20, 25)');
call unpack('generated-69');
call oracle_save_s('generated-69');
call pack('generated-69');
call save_s('generated-69', 0, '[25, 55)');

\echo 'generated-70 - [scos]'
insert into s(id, value, valid_period) values ('generated-70', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-70', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-70', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-70', 1, '[ 0,  5)');
call unpack('generated-70');
call oracle_save_s('generated-70');
call pack('generated-70');
call save_s('generated-70', 0, '[25, 55)');

\echo 'generated-71 - [sccs]'
insert into s(id, value, valid_period) values ('generated-71', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-71', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-71', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-71', 1, '[ 0,  5)');
call unpack('generated-71');
call oracle_save_s('generated-71');
call pack('generated-71');
call save_s('generated-71', 0, '[25, 55)');

\echo 'generated-72 - [scso]'
insert into s(id, value, valid_period) values ('generated-72', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-72', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-72', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-72', 1, '[20, 30)');
call unpack('generated-72');
call oracle_save_s('generated-72');
call pack('generated-72');
call save_s('generated-72', 0, '[25, 55)');

\echo 'generated-73 - [scsc]'
insert into s(id, value, valid_period) values ('generated-73', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-73', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-73', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-73', 0, '[20, 25)');
call unpack('generated-73');
call oracle_save_s('generated-73');
call pack('generated-73');
call save_s('generated-73', 0, '[25, 55)');

\echo 'generated-74 - [scss]'
insert into s(id, value, valid_period) values ('generated-74', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-74', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-74', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-74', 1, '[ 0,  5)');
call unpack('generated-74');
call oracle_save_s('generated-74');
call pack('generated-74');
call save_s('generated-74', 0, '[25, 55)');

\echo 'generated-75 - [ssoo]'
insert into s(id, value, valid_period) values ('generated-75', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-75', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-75', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-75', 1, '[20, 30)');
call unpack('generated-75');
call oracle_save_s('generated-75');
call pack('generated-75');
call save_s('generated-75', 0, '[25, 55)');

\echo 'generated-76 - [ssoc]'
insert into s(id, value, valid_period) values ('generated-76', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-76', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-76', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-76', 0, '[20, 25)');
call unpack('generated-76');
call oracle_save_s('generated-76');
call pack('generated-76');
call save_s('generated-76', 0, '[25, 55)');

\echo 'generated-77 - [ssos]'
insert into s(id, value, valid_period) values ('generated-77', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-77', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-77', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-77', 1, '[ 0,  5)');
call unpack('generated-77');
call oracle_save_s('generated-77');
call pack('generated-77');
call save_s('generated-77', 0, '[25, 55)');

\echo 'generated-78 - [sscs]'
insert into s(id, value, valid_period) values ('generated-78', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-78', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-78', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-78', 1, '[ 0,  5)');
call unpack('generated-78');
call oracle_save_s('generated-78');
call pack('generated-78');
call save_s('generated-78', 0, '[25, 55)');

\echo 'generated-79 - [ssso]'
insert into s(id, value, valid_period) values ('generated-79', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-79', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-79', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-79', 1, '[20, 30)');
call unpack('generated-79');
call oracle_save_s('generated-79');
call pack('generated-79');
call save_s('generated-79', 0, '[25, 55)');

\echo 'generated-80 - [sssc]'
insert into s(id, value, valid_period) values ('generated-80', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-80', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-80', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-80', 0, '[20, 25)');
call unpack('generated-80');
call oracle_save_s('generated-80');
call pack('generated-80');
call save_s('generated-80', 0, '[25, 55)');

\echo 'generated-81 - [ssss]'
insert into s(id, value, valid_period) values ('generated-81', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-81', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-81', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-81', 1, '[ 0,  5)');
call unpack('generated-81');
call oracle_save_s('generated-81');
call pack('generated-81');
call save_s('generated-81', 0, '[25, 55)');

select id as "failed_tests"
  from (select distinct unnest(array[s.id, packed.id]) id
          from s
          full outer join packed using (id, value, valid_period)
         where s.id is null or packed.id is null) x
 where x is not null



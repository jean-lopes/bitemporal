\set QUIET 'on'

delete from s where id like 'generated-remove-%';

\echo 'generated-remove-01 - [----]'
call oracle_remove_s($$x.id = 'generated-remove-01'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-01'$$, '[25,55)');


\echo 'generated-remove-02 - [---c]'
insert into s(id, value, valid_period) values ('generated-remove-02', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-02'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-02'$$, '[25,55)');


\echo 'generated-remove-03 - [---s]'
insert into s(id, value, valid_period) values ('generated-remove-03', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-03'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-03'$$, '[25,55)');


\echo 'generated-remove-04 - [---o]'
insert into s(id, value, valid_period) values ('generated-remove-04', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-04'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-04'$$, '[25,55)');


\echo 'generated-remove-05 - [--cs]'
insert into s(id, value, valid_period) values ('generated-remove-05', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-05', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-05'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-05'$$, '[25,55)');


\echo 'generated-remove-06 - [--sc]'
insert into s(id, value, valid_period) values ('generated-remove-06', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-06', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-06'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-06'$$, '[25,55)');


\echo 'generated-remove-07 - [--ss]'
insert into s(id, value, valid_period) values ('generated-remove-07', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-07', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-07'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-07'$$, '[25,55)');


\echo 'generated-remove-08 - [--so]'
insert into s(id, value, valid_period) values ('generated-remove-08', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-08', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-08'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-08'$$, '[25,55)');


\echo 'generated-remove-09 - [--oc]'
insert into s(id, value, valid_period) values ('generated-remove-09', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-09', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-09'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-09'$$, '[25,55)');


\echo 'generated-remove-10 - [--os]'
insert into s(id, value, valid_period) values ('generated-remove-10', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-10', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-10'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-10'$$, '[25,55)');


\echo 'generated-remove-11 - [--oo]'
insert into s(id, value, valid_period) values ('generated-remove-11', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-11', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-11'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-11'$$, '[25,55)');


\echo 'generated-remove-12 - [-ccs]'
insert into s(id, value, valid_period) values ('generated-remove-12', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-12', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-12', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-12'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-12'$$, '[25,55)');


\echo 'generated-remove-13 - [-csc]'
insert into s(id, value, valid_period) values ('generated-remove-13', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-13', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-13', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-13'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-13'$$, '[25,55)');


\echo 'generated-remove-14 - [-css]'
insert into s(id, value, valid_period) values ('generated-remove-14', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-14', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-14', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-14'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-14'$$, '[25,55)');


\echo 'generated-remove-15 - [-cso]'
insert into s(id, value, valid_period) values ('generated-remove-15', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-15', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-15', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-15'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-15'$$, '[25,55)');


\echo 'generated-remove-16 - [-coc]'
insert into s(id, value, valid_period) values ('generated-remove-16', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-16', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-16', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-16'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-16'$$, '[25,55)');


\echo 'generated-remove-17 - [-cos]'
insert into s(id, value, valid_period) values ('generated-remove-17', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-17', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-17', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-17'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-17'$$, '[25,55)');


\echo 'generated-remove-18 - [-coo]'
insert into s(id, value, valid_period) values ('generated-remove-18', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-18', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-18', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-18'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-18'$$, '[25,55)');


\echo 'generated-remove-19 - [-scs]'
insert into s(id, value, valid_period) values ('generated-remove-19', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-19', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-19', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-19'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-19'$$, '[25,55)');


\echo 'generated-remove-20 - [-ssc]'
insert into s(id, value, valid_period) values ('generated-remove-20', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-20', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-20', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-20'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-20'$$, '[25,55)');


\echo 'generated-remove-21 - [-sss]'
insert into s(id, value, valid_period) values ('generated-remove-21', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-21', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-21', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-21'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-21'$$, '[25,55)');


\echo 'generated-remove-22 - [-sso]'
insert into s(id, value, valid_period) values ('generated-remove-22', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-22', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-22', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-22'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-22'$$, '[25,55)');


\echo 'generated-remove-23 - [-soc]'
insert into s(id, value, valid_period) values ('generated-remove-23', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-23', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-23', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-23'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-23'$$, '[25,55)');


\echo 'generated-remove-24 - [-sos]'
insert into s(id, value, valid_period) values ('generated-remove-24', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-24', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-24', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-24'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-24'$$, '[25,55)');


\echo 'generated-remove-25 - [-soo]'
insert into s(id, value, valid_period) values ('generated-remove-25', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-25', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-25', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-25'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-25'$$, '[25,55)');


\echo 'generated-remove-26 - [-ocs]'
insert into s(id, value, valid_period) values ('generated-remove-26', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-26', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-26', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-26'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-26'$$, '[25,55)');


\echo 'generated-remove-27 - [-osc]'
insert into s(id, value, valid_period) values ('generated-remove-27', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-27', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-27', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-27'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-27'$$, '[25,55)');


\echo 'generated-remove-28 - [-oss]'
insert into s(id, value, valid_period) values ('generated-remove-28', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-28', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-28', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-28'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-28'$$, '[25,55)');


\echo 'generated-remove-29 - [-oso]'
insert into s(id, value, valid_period) values ('generated-remove-29', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-29', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-29', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-29'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-29'$$, '[25,55)');


\echo 'generated-remove-30 - [-ooc]'
insert into s(id, value, valid_period) values ('generated-remove-30', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-30', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-30', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-30'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-30'$$, '[25,55)');


\echo 'generated-remove-31 - [-oos]'
insert into s(id, value, valid_period) values ('generated-remove-31', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-31', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-31', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-31'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-31'$$, '[25,55)');


\echo 'generated-remove-32 - [-ooo]'
insert into s(id, value, valid_period) values ('generated-remove-32', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-32', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-32', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-32'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-32'$$, '[25,55)');


\echo 'generated-remove-33 - [cssc]'
insert into s(id, value, valid_period) values ('generated-remove-33', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-33', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-33', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-33', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-33'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-33'$$, '[25,55)');


\echo 'generated-remove-34 - [cosc]'
insert into s(id, value, valid_period) values ('generated-remove-34', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-34', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-34', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-34', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-34'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-34'$$, '[25,55)');


\echo 'generated-remove-35 - [scsc]'
insert into s(id, value, valid_period) values ('generated-remove-35', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-35', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-35', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-35', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-35'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-35'$$, '[25,55)');


\echo 'generated-remove-36 - [sssc]'
insert into s(id, value, valid_period) values ('generated-remove-36', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-36', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-36', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-36', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-36'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-36'$$, '[25,55)');


\echo 'generated-remove-37 - [sosc]'
insert into s(id, value, valid_period) values ('generated-remove-37', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-37', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-37', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-37', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-37'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-37'$$, '[25,55)');


\echo 'generated-remove-38 - [ossc]'
insert into s(id, value, valid_period) values ('generated-remove-38', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-38', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-38', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-38', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-38'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-38'$$, '[25,55)');


\echo 'generated-remove-39 - [oosc]'
insert into s(id, value, valid_period) values ('generated-remove-39', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-39', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-39', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-39', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-39'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-39'$$, '[25,55)');


\echo 'generated-remove-40 - [csoc]'
insert into s(id, value, valid_period) values ('generated-remove-40', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-40', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-40', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-40', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-40'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-40'$$, '[25,55)');


\echo 'generated-remove-41 - [cooc]'
insert into s(id, value, valid_period) values ('generated-remove-41', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-41', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-41', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-41', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-41'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-41'$$, '[25,55)');


\echo 'generated-remove-42 - [scoc]'
insert into s(id, value, valid_period) values ('generated-remove-42', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-42', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-42', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-42', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-42'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-42'$$, '[25,55)');


\echo 'generated-remove-43 - [ssoc]'
insert into s(id, value, valid_period) values ('generated-remove-43', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-43', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-43', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-43', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-43'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-43'$$, '[25,55)');


\echo 'generated-remove-44 - [sooc]'
insert into s(id, value, valid_period) values ('generated-remove-44', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-44', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-44', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-44', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-44'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-44'$$, '[25,55)');


\echo 'generated-remove-45 - [osoc]'
insert into s(id, value, valid_period) values ('generated-remove-45', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-45', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-45', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-45', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-45'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-45'$$, '[25,55)');


\echo 'generated-remove-46 - [oooc]'
insert into s(id, value, valid_period) values ('generated-remove-46', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-46', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-46', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-46', 0, '[20, 25)');
call oracle_remove_s($$x.id = 'generated-remove-46'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-46'$$, '[25,55)');


\echo 'generated-remove-47 - [cscs]'
insert into s(id, value, valid_period) values ('generated-remove-47', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-47', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-47', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-47', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-47'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-47'$$, '[25,55)');


\echo 'generated-remove-48 - [cocs]'
insert into s(id, value, valid_period) values ('generated-remove-48', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-48', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-48', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-48', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-48'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-48'$$, '[25,55)');


\echo 'generated-remove-49 - [sccs]'
insert into s(id, value, valid_period) values ('generated-remove-49', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-49', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-49', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-49', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-49'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-49'$$, '[25,55)');


\echo 'generated-remove-50 - [sscs]'
insert into s(id, value, valid_period) values ('generated-remove-50', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-50', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-50', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-50', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-50'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-50'$$, '[25,55)');


\echo 'generated-remove-51 - [socs]'
insert into s(id, value, valid_period) values ('generated-remove-51', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-51', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-51', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-51', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-51'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-51'$$, '[25,55)');


\echo 'generated-remove-52 - [oscs]'
insert into s(id, value, valid_period) values ('generated-remove-52', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-52', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-52', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-52', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-52'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-52'$$, '[25,55)');


\echo 'generated-remove-53 - [oocs]'
insert into s(id, value, valid_period) values ('generated-remove-53', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-53', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-53', 0, '[20, 25)');
insert into s(id, value, valid_period) values ('generated-remove-53', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-53'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-53'$$, '[25,55)');


\echo 'generated-remove-54 - [csss]'
insert into s(id, value, valid_period) values ('generated-remove-54', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-54', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-54', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-54', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-54'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-54'$$, '[25,55)');


\echo 'generated-remove-55 - [coss]'
insert into s(id, value, valid_period) values ('generated-remove-55', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-55', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-55', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-55', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-55'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-55'$$, '[25,55)');


\echo 'generated-remove-56 - [scss]'
insert into s(id, value, valid_period) values ('generated-remove-56', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-56', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-56', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-56', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-56'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-56'$$, '[25,55)');


\echo 'generated-remove-57 - [ssss]'
insert into s(id, value, valid_period) values ('generated-remove-57', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-57', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-57', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-57', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-57'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-57'$$, '[25,55)');


\echo 'generated-remove-58 - [soss]'
insert into s(id, value, valid_period) values ('generated-remove-58', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-58', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-58', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-58', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-58'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-58'$$, '[25,55)');


\echo 'generated-remove-59 - [osss]'
insert into s(id, value, valid_period) values ('generated-remove-59', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-59', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-59', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-59', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-59'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-59'$$, '[25,55)');


\echo 'generated-remove-60 - [ooss]'
insert into s(id, value, valid_period) values ('generated-remove-60', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-60', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-60', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-60', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-60'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-60'$$, '[25,55)');


\echo 'generated-remove-61 - [csos]'
insert into s(id, value, valid_period) values ('generated-remove-61', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-61', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-61', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-61', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-61'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-61'$$, '[25,55)');


\echo 'generated-remove-62 - [coos]'
insert into s(id, value, valid_period) values ('generated-remove-62', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-62', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-62', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-62', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-62'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-62'$$, '[25,55)');


\echo 'generated-remove-63 - [scos]'
insert into s(id, value, valid_period) values ('generated-remove-63', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-63', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-63', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-63', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-63'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-63'$$, '[25,55)');


\echo 'generated-remove-64 - [ssos]'
insert into s(id, value, valid_period) values ('generated-remove-64', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-64', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-64', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-64', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-64'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-64'$$, '[25,55)');


\echo 'generated-remove-65 - [soos]'
insert into s(id, value, valid_period) values ('generated-remove-65', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-65', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-65', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-65', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-65'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-65'$$, '[25,55)');


\echo 'generated-remove-66 - [osos]'
insert into s(id, value, valid_period) values ('generated-remove-66', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-66', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-66', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-66', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-66'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-66'$$, '[25,55)');


\echo 'generated-remove-67 - [ooos]'
insert into s(id, value, valid_period) values ('generated-remove-67', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-67', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-67', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-67', 1, '[ 0,  5)');
call oracle_remove_s($$x.id = 'generated-remove-67'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-67'$$, '[25,55)');


\echo 'generated-remove-68 - [csso]'
insert into s(id, value, valid_period) values ('generated-remove-68', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-68', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-68', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-68', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-68'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-68'$$, '[25,55)');


\echo 'generated-remove-69 - [coso]'
insert into s(id, value, valid_period) values ('generated-remove-69', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-69', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-69', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-69', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-69'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-69'$$, '[25,55)');


\echo 'generated-remove-70 - [scso]'
insert into s(id, value, valid_period) values ('generated-remove-70', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-70', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-70', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-70', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-70'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-70'$$, '[25,55)');


\echo 'generated-remove-71 - [ssso]'
insert into s(id, value, valid_period) values ('generated-remove-71', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-71', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-71', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-71', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-71'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-71'$$, '[25,55)');


\echo 'generated-remove-72 - [soso]'
insert into s(id, value, valid_period) values ('generated-remove-72', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-72', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-72', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-72', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-72'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-72'$$, '[25,55)');


\echo 'generated-remove-73 - [osso]'
insert into s(id, value, valid_period) values ('generated-remove-73', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-73', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-73', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-73', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-73'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-73'$$, '[25,55)');


\echo 'generated-remove-74 - [ooso]'
insert into s(id, value, valid_period) values ('generated-remove-74', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-74', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-74', 2, '[10, 15)');
insert into s(id, value, valid_period) values ('generated-remove-74', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-74'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-74'$$, '[25,55)');


\echo 'generated-remove-75 - [csoo]'
insert into s(id, value, valid_period) values ('generated-remove-75', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-75', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-75', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-75', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-75'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-75'$$, '[25,55)');


\echo 'generated-remove-76 - [cooo]'
insert into s(id, value, valid_period) values ('generated-remove-76', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-76', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-76', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-76', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-76'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-76'$$, '[25,55)');


\echo 'generated-remove-77 - [scoo]'
insert into s(id, value, valid_period) values ('generated-remove-77', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-77', 0, '[55, 60)');
insert into s(id, value, valid_period) values ('generated-remove-77', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-77', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-77'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-77'$$, '[25,55)');


\echo 'generated-remove-78 - [ssoo]'
insert into s(id, value, valid_period) values ('generated-remove-78', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-78', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-78', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-78', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-78'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-78'$$, '[25,55)');


\echo 'generated-remove-79 - [sooo]'
insert into s(id, value, valid_period) values ('generated-remove-79', 4, '[75, 80)');
insert into s(id, value, valid_period) values ('generated-remove-79', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-79', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-79', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-79'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-79'$$, '[25,55)');


\echo 'generated-remove-80 - [osoo]'
insert into s(id, value, valid_period) values ('generated-remove-80', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-80', 3, '[65, 70)');
insert into s(id, value, valid_period) values ('generated-remove-80', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-80', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-80'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-80'$$, '[25,55)');


\echo 'generated-remove-81 - [oooo]'
insert into s(id, value, valid_period) values ('generated-remove-81', 4, '[50, 60)');
insert into s(id, value, valid_period) values ('generated-remove-81', 3, '[40, 50)');
insert into s(id, value, valid_period) values ('generated-remove-81', 2, '[30, 40)');
insert into s(id, value, valid_period) values ('generated-remove-81', 1, '[20, 30)');
call oracle_remove_s($$x.id = 'generated-remove-81'$$, '[25, 55)');
call remove_s($$x.id = 'generated-remove-81'$$, '[25,55)');


select id as "failed_tests"
  from (select distinct unnest(array[s.id, packed.id]) id
          from s
          full outer join packed using (id, value, valid_period)
         where s.id is null or packed.id is null) x
 where id is not null and id like 'generated-remove-%'


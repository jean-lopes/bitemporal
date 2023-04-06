 \set QUIET 'on'

truncate s;

\echo 'test-01 - [----]'
call unpack(1);
call oracle_save_s(1);
call pack(1);
call save_s(1, 0, '[25, 55)');

\echo 'test-02 - [---o]'
insert into s(id, value, valid_period) values (2, 1, '[20, 30)');
call unpack(2);
call oracle_save_s(2);
call pack(2);
call save_s(2, 0, '[25, 55)');

\echo 'test-03 - [---c]'
insert into s(id, value, valid_period) values (3, 0, '[20, 25)');
call unpack(3);
call oracle_save_s(3);
call pack(3);
call save_s(3, 0, '[25, 55)');

\echo 'test-04 - [---s]'
insert into s(id, value, valid_period) values (4, 1, '[ 0,  5)');
call unpack(4);
call oracle_save_s(4);
call pack(4);
call save_s(4, 0, '[25, 55)');

\echo 'test-05 - [--oo]'
insert into s(id, value, valid_period) values (5, 2, '[30, 40)');
insert into s(id, value, valid_period) values (5, 1, '[20, 30)');
call unpack(5);
call oracle_save_s(5);
call pack(5);
call save_s(5, 0, '[25, 55)');

\echo 'test-06 - [--oc]'
insert into s(id, value, valid_period) values (6, 2, '[30, 40)');
insert into s(id, value, valid_period) values (6, 0, '[20, 25)');
call unpack(6);
call oracle_save_s(6);
call pack(6);
call save_s(6, 0, '[25, 55)');

\echo 'test-07 - [--os]'
insert into s(id, value, valid_period) values (7, 2, '[30, 40)');
insert into s(id, value, valid_period) values (7, 1, '[ 0,  5)');
call unpack(7);
call oracle_save_s(7);
call pack(7);
call save_s(7, 0, '[25, 55)');

\echo 'test-08 - [--cs]'
insert into s(id, value, valid_period) values (8, 0, '[20, 25)');
insert into s(id, value, valid_period) values (8, 1, '[ 0,  5)');
call unpack(8);
call oracle_save_s(8);
call pack(8);
call save_s(8, 0, '[25, 55)');

\echo 'test-09 - [--so]'
insert into s(id, value, valid_period) values (9, 2, '[10, 15)');
insert into s(id, value, valid_period) values (9, 1, '[20, 30)');
call unpack(9);
call oracle_save_s(9);
call pack(9);
call save_s(9, 0, '[25, 55)');

\echo 'test-10 - [--sc]'
insert into s(id, value, valid_period) values (10, 2, '[10, 15)');
insert into s(id, value, valid_period) values (10, 0, '[20, 25)');
call unpack(10);
call oracle_save_s(10);
call pack(10);
call save_s(10, 0, '[25, 55)');

\echo 'test-11 - [--ss]'
insert into s(id, value, valid_period) values (11, 2, '[10, 15)');
insert into s(id, value, valid_period) values (11, 1, '[ 0,  5)');
call unpack(11);
call oracle_save_s(11);
call pack(11);
call save_s(11, 0, '[25, 55)');

\echo 'test-12 - [-ooo]'
insert into s(id, value, valid_period) values (12, 3, '[40, 50)');
insert into s(id, value, valid_period) values (12, 2, '[30, 40)');
insert into s(id, value, valid_period) values (12, 1, '[20, 30)');
call unpack(12);
call oracle_save_s(12);
call pack(12);
call save_s(12, 0, '[25, 55)');

\echo 'test-13 - [-coo]'
insert into s(id, value, valid_period) values (13, 0, '[55, 60)');
insert into s(id, value, valid_period) values (13, 2, '[30, 40)');
insert into s(id, value, valid_period) values (13, 1, '[20, 30)');
call unpack(13);
call oracle_save_s(13);
call pack(13);
call save_s(13, 0, '[25, 55)');

\echo 'test-14 - [-soo]'
insert into s(id, value, valid_period) values (14, 3, '[65, 70)');
insert into s(id, value, valid_period) values (14, 2, '[30, 40)');
insert into s(id, value, valid_period) values (14, 1, '[20, 30)');
call unpack(14);
call oracle_save_s(14);
call pack(14);
call save_s(14, 0, '[25, 55)');

\echo 'test-15 - [-ooc]'
insert into s(id, value, valid_period) values (15, 3, '[40, 50)');
insert into s(id, value, valid_period) values (15, 2, '[30, 40)');
insert into s(id, value, valid_period) values (15, 0, '[20, 25)');
call unpack(15);
call oracle_save_s(15);
call pack(15);
call save_s(15, 0, '[25, 55)');

\echo 'test-16 - [-coc]'
insert into s(id, value, valid_period) values (16, 0, '[55, 60)');
insert into s(id, value, valid_period) values (16, 2, '[30, 40)');
insert into s(id, value, valid_period) values (16, 0, '[20, 25)');
call unpack(16);
call oracle_save_s(16);
call pack(16);
call save_s(16, 0, '[25, 55)');

\echo 'test-17 - [-soc]'
insert into s(id, value, valid_period) values (17, 3, '[65, 70)');
insert into s(id, value, valid_period) values (17, 2, '[30, 40)');
insert into s(id, value, valid_period) values (17, 0, '[20, 25)');
call unpack(17);
call oracle_save_s(17);
call pack(17);
call save_s(17, 0, '[25, 55)');

\echo 'test-18 - [-oos]'
insert into s(id, value, valid_period) values (18, 3, '[40, 50)');
insert into s(id, value, valid_period) values (18, 2, '[30, 40)');
insert into s(id, value, valid_period) values (18, 1, '[ 0,  5)');
call unpack(18);
call oracle_save_s(18);
call pack(18);
call save_s(18, 0, '[25, 55)');

\echo 'test-19 - [-cos]'
insert into s(id, value, valid_period) values (19, 0, '[55, 60)');
insert into s(id, value, valid_period) values (19, 2, '[30, 40)');
insert into s(id, value, valid_period) values (19, 1, '[ 0,  5)');
call unpack(19);
call oracle_save_s(19);
call pack(19);
call save_s(19, 0, '[25, 55)');

\echo 'test-20 - [-sos]'
insert into s(id, value, valid_period) values (20, 3, '[65, 70)');
insert into s(id, value, valid_period) values (20, 2, '[30, 40)');
insert into s(id, value, valid_period) values (20, 1, '[ 0,  5)');
call unpack(20);
call oracle_save_s(20);
call pack(20);
call save_s(20, 0, '[25, 55)');

\echo 'test-21 - [-ocs]'
insert into s(id, value, valid_period) values (21, 3, '[40, 50)');
insert into s(id, value, valid_period) values (21, 0, '[20, 25)');
insert into s(id, value, valid_period) values (21, 1, '[ 0,  5)');
call unpack(21);
call oracle_save_s(21);
call pack(21);
call save_s(21, 0, '[25, 55)');

\echo 'test-22 - [-ccs]'
insert into s(id, value, valid_period) values (22, 0, '[55, 60)');
insert into s(id, value, valid_period) values (22, 0, '[20, 25)');
insert into s(id, value, valid_period) values (22, 1, '[ 0,  5)');
call unpack(22);
call oracle_save_s(22);
call pack(22);
call save_s(22, 0, '[25, 55)');

\echo 'test-23 - [-scs]'
insert into s(id, value, valid_period) values (23, 3, '[65, 70)');
insert into s(id, value, valid_period) values (23, 0, '[20, 25)');
insert into s(id, value, valid_period) values (23, 1, '[ 0,  5)');
call unpack(23);
call oracle_save_s(23);
call pack(23);
call save_s(23, 0, '[25, 55)');

\echo 'test-24 - [-oso]'
insert into s(id, value, valid_period) values (24, 3, '[40, 50)');
insert into s(id, value, valid_period) values (24, 2, '[10, 15)');
insert into s(id, value, valid_period) values (24, 1, '[20, 30)');
call unpack(24);
call oracle_save_s(24);
call pack(24);
call save_s(24, 0, '[25, 55)');

\echo 'test-25 - [-cso]'
insert into s(id, value, valid_period) values (25, 0, '[55, 60)');
insert into s(id, value, valid_period) values (25, 2, '[10, 15)');
insert into s(id, value, valid_period) values (25, 1, '[20, 30)');
call unpack(25);
call oracle_save_s(25);
call pack(25);
call save_s(25, 0, '[25, 55)');

\echo 'test-26 - [-sso]'
insert into s(id, value, valid_period) values (26, 3, '[65, 70)');
insert into s(id, value, valid_period) values (26, 2, '[10, 15)');
insert into s(id, value, valid_period) values (26, 1, '[20, 30)');
call unpack(26);
call oracle_save_s(26);
call pack(26);
call save_s(26, 0, '[25, 55)');

\echo 'test-27 - [-osc]'
insert into s(id, value, valid_period) values (27, 3, '[40, 50)');
insert into s(id, value, valid_period) values (27, 2, '[10, 15)');
insert into s(id, value, valid_period) values (27, 0, '[20, 25)');
call unpack(27);
call oracle_save_s(27);
call pack(27);
call save_s(27, 0, '[25, 55)');

\echo 'test-28 - [-csc]'
insert into s(id, value, valid_period) values (28, 0, '[55, 60)');
insert into s(id, value, valid_period) values (28, 2, '[10, 15)');
insert into s(id, value, valid_period) values (28, 0, '[20, 25)');
call unpack(28);
call oracle_save_s(28);
call pack(28);
call save_s(28, 0, '[25, 55)');

\echo 'test-29 - [-ssc]'
insert into s(id, value, valid_period) values (29, 3, '[65, 70)');
insert into s(id, value, valid_period) values (29, 2, '[10, 15)');
insert into s(id, value, valid_period) values (29, 0, '[20, 25)');
call unpack(29);
call oracle_save_s(29);
call pack(29);
call save_s(29, 0, '[25, 55)');

\echo 'test-30 - [-oss]'
insert into s(id, value, valid_period) values (30, 3, '[40, 50)');
insert into s(id, value, valid_period) values (30, 2, '[10, 15)');
insert into s(id, value, valid_period) values (30, 1, '[ 0,  5)');
call unpack(30);
call oracle_save_s(30);
call pack(30);
call save_s(30, 0, '[25, 55)');

\echo 'test-31 - [-css]'
insert into s(id, value, valid_period) values (31, 0, '[55, 60)');
insert into s(id, value, valid_period) values (31, 2, '[10, 15)');
insert into s(id, value, valid_period) values (31, 1, '[ 0,  5)');
call unpack(31);
call oracle_save_s(31);
call pack(31);
call save_s(31, 0, '[25, 55)');

\echo 'test-32 - [-sss]'
insert into s(id, value, valid_period) values (32, 3, '[65, 70)');
insert into s(id, value, valid_period) values (32, 2, '[10, 15)');
insert into s(id, value, valid_period) values (32, 1, '[ 0,  5)');
call unpack(32);
call oracle_save_s(32);
call pack(32);
call save_s(32, 0, '[25, 55)');

\echo 'test-33 - [oooo]'
insert into s(id, value, valid_period) values (33, 4, '[50, 60)');
insert into s(id, value, valid_period) values (33, 3, '[40, 50)');
insert into s(id, value, valid_period) values (33, 2, '[30, 40)');
insert into s(id, value, valid_period) values (33, 1, '[20, 30)');
call unpack(33);
call oracle_save_s(33);
call pack(33);
call save_s(33, 0, '[25, 55)');

\echo 'test-34 - [oooc]'
insert into s(id, value, valid_period) values (34, 4, '[50, 60)');
insert into s(id, value, valid_period) values (34, 3, '[40, 50)');
insert into s(id, value, valid_period) values (34, 2, '[30, 40)');
insert into s(id, value, valid_period) values (34, 0, '[20, 25)');
call unpack(34);
call oracle_save_s(34);
call pack(34);
call save_s(34, 0, '[25, 55)');

\echo 'test-35 - [ooos]'
insert into s(id, value, valid_period) values (35, 4, '[50, 60)');
insert into s(id, value, valid_period) values (35, 3, '[40, 50)');
insert into s(id, value, valid_period) values (35, 2, '[30, 40)');
insert into s(id, value, valid_period) values (35, 1, '[ 0,  5)');
call unpack(35);
call oracle_save_s(35);
call pack(35);
call save_s(35, 0, '[25, 55)');

\echo 'test-36 - [oocs]'
insert into s(id, value, valid_period) values (36, 4, '[50, 60)');
insert into s(id, value, valid_period) values (36, 3, '[40, 50)');
insert into s(id, value, valid_period) values (36, 0, '[20, 25)');
insert into s(id, value, valid_period) values (36, 1, '[ 0,  5)');
call unpack(36);
call oracle_save_s(36);
call pack(36);
call save_s(36, 0, '[25, 55)');

\echo 'test-37 - [ooso]'
insert into s(id, value, valid_period) values (37, 4, '[50, 60)');
insert into s(id, value, valid_period) values (37, 3, '[40, 50)');
insert into s(id, value, valid_period) values (37, 2, '[10, 15)');
insert into s(id, value, valid_period) values (37, 1, '[20, 30)');
call unpack(37);
call oracle_save_s(37);
call pack(37);
call save_s(37, 0, '[25, 55)');

\echo 'test-38 - [oosc]'
insert into s(id, value, valid_period) values (38, 4, '[50, 60)');
insert into s(id, value, valid_period) values (38, 3, '[40, 50)');
insert into s(id, value, valid_period) values (38, 2, '[10, 15)');
insert into s(id, value, valid_period) values (38, 0, '[20, 25)');
call unpack(38);
call oracle_save_s(38);
call pack(38);
call save_s(38, 0, '[25, 55)');

\echo 'test-39 - [ooss]'
insert into s(id, value, valid_period) values (39, 4, '[50, 60)');
insert into s(id, value, valid_period) values (39, 3, '[40, 50)');
insert into s(id, value, valid_period) values (39, 2, '[10, 15)');
insert into s(id, value, valid_period) values (39, 1, '[ 0,  5)');
call unpack(39);
call oracle_save_s(39);
call pack(39);
call save_s(39, 0, '[25, 55)');

\echo 'test-40 - [osoo]'
insert into s(id, value, valid_period) values (40, 4, '[50, 60)');
insert into s(id, value, valid_period) values (40, 3, '[65, 70)');
insert into s(id, value, valid_period) values (40, 2, '[30, 40)');
insert into s(id, value, valid_period) values (40, 1, '[20, 30)');
call unpack(40);
call oracle_save_s(40);
call pack(40);
call save_s(40, 0, '[25, 55)');

\echo 'test-41 - [osoc]'
insert into s(id, value, valid_period) values (41, 4, '[50, 60)');
insert into s(id, value, valid_period) values (41, 3, '[65, 70)');
insert into s(id, value, valid_period) values (41, 2, '[30, 40)');
insert into s(id, value, valid_period) values (41, 0, '[20, 25)');
call unpack(41);
call oracle_save_s(41);
call pack(41);
call save_s(41, 0, '[25, 55)');

\echo 'test-42 - [osos]'
insert into s(id, value, valid_period) values (42, 4, '[50, 60)');
insert into s(id, value, valid_period) values (42, 3, '[65, 70)');
insert into s(id, value, valid_period) values (42, 2, '[30, 40)');
insert into s(id, value, valid_period) values (42, 1, '[ 0,  5)');
call unpack(42);
call oracle_save_s(42);
call pack(42);
call save_s(42, 0, '[25, 55)');

\echo 'test-43 - [oscs]'
insert into s(id, value, valid_period) values (43, 4, '[50, 60)');
insert into s(id, value, valid_period) values (43, 3, '[65, 70)');
insert into s(id, value, valid_period) values (43, 0, '[20, 25)');
insert into s(id, value, valid_period) values (43, 1, '[ 0,  5)');
call unpack(43);
call oracle_save_s(43);
call pack(43);
call save_s(43, 0, '[25, 55)');

\echo 'test-44 - [osso]'
insert into s(id, value, valid_period) values (44, 4, '[50, 60)');
insert into s(id, value, valid_period) values (44, 3, '[65, 70)');
insert into s(id, value, valid_period) values (44, 2, '[10, 15)');
insert into s(id, value, valid_period) values (44, 1, '[20, 30)');
call unpack(44);
call oracle_save_s(44);
call pack(44);
call save_s(44, 0, '[25, 55)');

\echo 'test-45 - [ossc]'
insert into s(id, value, valid_period) values (45, 4, '[50, 60)');
insert into s(id, value, valid_period) values (45, 3, '[65, 70)');
insert into s(id, value, valid_period) values (45, 2, '[10, 15)');
insert into s(id, value, valid_period) values (45, 0, '[20, 25)');
call unpack(45);
call oracle_save_s(45);
call pack(45);
call save_s(45, 0, '[25, 55)');

\echo 'test-46 - [osss]'
insert into s(id, value, valid_period) values (46, 4, '[50, 60)');
insert into s(id, value, valid_period) values (46, 3, '[65, 70)');
insert into s(id, value, valid_period) values (46, 2, '[10, 15)');
insert into s(id, value, valid_period) values (46, 1, '[ 0,  5)');
call unpack(46);
call oracle_save_s(46);
call pack(46);
call save_s(46, 0, '[25, 55)');

\echo 'test-47 - [cooo]'
insert into s(id, value, valid_period) values (47, 0, '[55, 60)');
insert into s(id, value, valid_period) values (47, 3, '[40, 50)');
insert into s(id, value, valid_period) values (47, 2, '[30, 40)');
insert into s(id, value, valid_period) values (47, 1, '[20, 30)');
call unpack(47);
call oracle_save_s(47);
call pack(47);
call save_s(47, 0, '[25, 55)');

\echo 'test-48 - [cooc]'
insert into s(id, value, valid_period) values (48, 0, '[55, 60)');
insert into s(id, value, valid_period) values (48, 3, '[40, 50)');
insert into s(id, value, valid_period) values (48, 2, '[30, 40)');
insert into s(id, value, valid_period) values (48, 0, '[20, 25)');
call unpack(48);
call oracle_save_s(48);
call pack(48);
call save_s(48, 0, '[25, 55)');

\echo 'test-49 - [coos]'
insert into s(id, value, valid_period) values (49, 0, '[55, 60)');
insert into s(id, value, valid_period) values (49, 3, '[40, 50)');
insert into s(id, value, valid_period) values (49, 2, '[30, 40)');
insert into s(id, value, valid_period) values (49, 1, '[ 0,  5)');
call unpack(49);
call oracle_save_s(49);
call pack(49);
call save_s(49, 0, '[25, 55)');

\echo 'test-50 - [cocs]'
insert into s(id, value, valid_period) values (50, 0, '[55, 60)');
insert into s(id, value, valid_period) values (50, 3, '[40, 50)');
insert into s(id, value, valid_period) values (50, 0, '[20, 25)');
insert into s(id, value, valid_period) values (50, 1, '[ 0,  5)');
call unpack(50);
call oracle_save_s(50);
call pack(50);
call save_s(50, 0, '[25, 55)');

\echo 'test-51 - [coso]'
insert into s(id, value, valid_period) values (51, 0, '[55, 60)');
insert into s(id, value, valid_period) values (51, 3, '[40, 50)');
insert into s(id, value, valid_period) values (51, 2, '[10, 15)');
insert into s(id, value, valid_period) values (51, 1, '[20, 30)');
call unpack(51);
call oracle_save_s(51);
call pack(51);
call save_s(51, 0, '[25, 55)');

\echo 'test-52 - [cosc]'
insert into s(id, value, valid_period) values (52, 0, '[55, 60)');
insert into s(id, value, valid_period) values (52, 3, '[40, 50)');
insert into s(id, value, valid_period) values (52, 2, '[10, 15)');
insert into s(id, value, valid_period) values (52, 0, '[20, 25)');
call unpack(52);
call oracle_save_s(52);
call pack(52);
call save_s(52, 0, '[25, 55)');

\echo 'test-53 - [coss]'
insert into s(id, value, valid_period) values (53, 0, '[55, 60)');
insert into s(id, value, valid_period) values (53, 3, '[40, 50)');
insert into s(id, value, valid_period) values (53, 2, '[10, 15)');
insert into s(id, value, valid_period) values (53, 1, '[ 0,  5)');
call unpack(53);
call oracle_save_s(53);
call pack(53);
call save_s(53, 0, '[25, 55)');

\echo 'test-54 - [csoo]'
insert into s(id, value, valid_period) values (54, 0, '[55, 60)');
insert into s(id, value, valid_period) values (54, 3, '[65, 70)');
insert into s(id, value, valid_period) values (54, 2, '[30, 40)');
insert into s(id, value, valid_period) values (54, 1, '[20, 30)');
call unpack(54);
call oracle_save_s(54);
call pack(54);
call save_s(54, 0, '[25, 55)');

\echo 'test-55 - [csoc]'
insert into s(id, value, valid_period) values (55, 0, '[55, 60)');
insert into s(id, value, valid_period) values (55, 3, '[65, 70)');
insert into s(id, value, valid_period) values (55, 2, '[30, 40)');
insert into s(id, value, valid_period) values (55, 0, '[20, 25)');
call unpack(55);
call oracle_save_s(55);
call pack(55);
call save_s(55, 0, '[25, 55)');

\echo 'test-56 - [csos]'
insert into s(id, value, valid_period) values (56, 0, '[55, 60)');
insert into s(id, value, valid_period) values (56, 3, '[65, 70)');
insert into s(id, value, valid_period) values (56, 2, '[30, 40)');
insert into s(id, value, valid_period) values (56, 1, '[ 0,  5)');
call unpack(56);
call oracle_save_s(56);
call pack(56);
call save_s(56, 0, '[25, 55)');

\echo 'test-57 - [cscs]'
insert into s(id, value, valid_period) values (57, 0, '[55, 60)');
insert into s(id, value, valid_period) values (57, 3, '[65, 70)');
insert into s(id, value, valid_period) values (57, 0, '[20, 25)');
insert into s(id, value, valid_period) values (57, 1, '[ 0,  5)');
call unpack(57);
call oracle_save_s(57);
call pack(57);
call save_s(57, 0, '[25, 55)');

\echo 'test-58 - [csso]'
insert into s(id, value, valid_period) values (58, 0, '[55, 60)');
insert into s(id, value, valid_period) values (58, 3, '[65, 70)');
insert into s(id, value, valid_period) values (58, 2, '[10, 15)');
insert into s(id, value, valid_period) values (58, 1, '[20, 30)');
call unpack(58);
call oracle_save_s(58);
call pack(58);
call save_s(58, 0, '[25, 55)');

\echo 'test-59 - [cssc]'
insert into s(id, value, valid_period) values (59, 0, '[55, 60)');
insert into s(id, value, valid_period) values (59, 3, '[65, 70)');
insert into s(id, value, valid_period) values (59, 2, '[10, 15)');
insert into s(id, value, valid_period) values (59, 0, '[20, 25)');
call unpack(59);
call oracle_save_s(59);
call pack(59);
call save_s(59, 0, '[25, 55)');

\echo 'test-60 - [csss]'
insert into s(id, value, valid_period) values (60, 0, '[55, 60)');
insert into s(id, value, valid_period) values (60, 3, '[65, 70)');
insert into s(id, value, valid_period) values (60, 2, '[10, 15)');
insert into s(id, value, valid_period) values (60, 1, '[ 0,  5)');
call unpack(60);
call oracle_save_s(60);
call pack(60);
call save_s(60, 0, '[25, 55)');

\echo 'test-61 - [sooo]'
insert into s(id, value, valid_period) values (61, 4, '[75, 80)');
insert into s(id, value, valid_period) values (61, 3, '[40, 50)');
insert into s(id, value, valid_period) values (61, 2, '[30, 40)');
insert into s(id, value, valid_period) values (61, 1, '[20, 30)');
call unpack(61);
call oracle_save_s(61);
call pack(61);
call save_s(61, 0, '[25, 55)');

\echo 'test-62 - [sooc]'
insert into s(id, value, valid_period) values (62, 4, '[75, 80)');
insert into s(id, value, valid_period) values (62, 3, '[40, 50)');
insert into s(id, value, valid_period) values (62, 2, '[30, 40)');
insert into s(id, value, valid_period) values (62, 0, '[20, 25)');
call unpack(62);
call oracle_save_s(62);
call pack(62);
call save_s(62, 0, '[25, 55)');

\echo 'test-63 - [soos]'
insert into s(id, value, valid_period) values (63, 4, '[75, 80)');
insert into s(id, value, valid_period) values (63, 3, '[40, 50)');
insert into s(id, value, valid_period) values (63, 2, '[30, 40)');
insert into s(id, value, valid_period) values (63, 1, '[ 0,  5)');
call unpack(63);
call oracle_save_s(63);
call pack(63);
call save_s(63, 0, '[25, 55)');

\echo 'test-64 - [socs]'
insert into s(id, value, valid_period) values (64, 4, '[75, 80)');
insert into s(id, value, valid_period) values (64, 3, '[40, 50)');
insert into s(id, value, valid_period) values (64, 0, '[20, 25)');
insert into s(id, value, valid_period) values (64, 1, '[ 0,  5)');
call unpack(64);
call oracle_save_s(64);
call pack(64);
call save_s(64, 0, '[25, 55)');

\echo 'test-65 - [soso]'
insert into s(id, value, valid_period) values (65, 4, '[75, 80)');
insert into s(id, value, valid_period) values (65, 3, '[40, 50)');
insert into s(id, value, valid_period) values (65, 2, '[10, 15)');
insert into s(id, value, valid_period) values (65, 1, '[20, 30)');
call unpack(65);
call oracle_save_s(65);
call pack(65);
call save_s(65, 0, '[25, 55)');

\echo 'test-66 - [sosc]'
insert into s(id, value, valid_period) values (66, 4, '[75, 80)');
insert into s(id, value, valid_period) values (66, 3, '[40, 50)');
insert into s(id, value, valid_period) values (66, 2, '[10, 15)');
insert into s(id, value, valid_period) values (66, 0, '[20, 25)');
call unpack(66);
call oracle_save_s(66);
call pack(66);
call save_s(66, 0, '[25, 55)');

\echo 'test-67 - [soss]'
insert into s(id, value, valid_period) values (67, 4, '[75, 80)');
insert into s(id, value, valid_period) values (67, 3, '[40, 50)');
insert into s(id, value, valid_period) values (67, 2, '[10, 15)');
insert into s(id, value, valid_period) values (67, 1, '[ 0,  5)');
call unpack(67);
call oracle_save_s(67);
call pack(67);
call save_s(67, 0, '[25, 55)');

\echo 'test-68 - [scoo]'
insert into s(id, value, valid_period) values (68, 4, '[75, 80)');
insert into s(id, value, valid_period) values (68, 0, '[55, 60)');
insert into s(id, value, valid_period) values (68, 2, '[30, 40)');
insert into s(id, value, valid_period) values (68, 1, '[20, 30)');
call unpack(68);
call oracle_save_s(68);
call pack(68);
call save_s(68, 0, '[25, 55)');

\echo 'test-69 - [scoc]'
insert into s(id, value, valid_period) values (69, 4, '[75, 80)');
insert into s(id, value, valid_period) values (69, 0, '[55, 60)');
insert into s(id, value, valid_period) values (69, 2, '[30, 40)');
insert into s(id, value, valid_period) values (69, 0, '[20, 25)');
call unpack(69);
call oracle_save_s(69);
call pack(69);
call save_s(69, 0, '[25, 55)');

\echo 'test-70 - [scos]'
insert into s(id, value, valid_period) values (70, 4, '[75, 80)');
insert into s(id, value, valid_period) values (70, 0, '[55, 60)');
insert into s(id, value, valid_period) values (70, 2, '[30, 40)');
insert into s(id, value, valid_period) values (70, 1, '[ 0,  5)');
call unpack(70);
call oracle_save_s(70);
call pack(70);
call save_s(70, 0, '[25, 55)');

\echo 'test-71 - [sccs]'
insert into s(id, value, valid_period) values (71, 4, '[75, 80)');
insert into s(id, value, valid_period) values (71, 0, '[55, 60)');
insert into s(id, value, valid_period) values (71, 0, '[20, 25)');
insert into s(id, value, valid_period) values (71, 1, '[ 0,  5)');
call unpack(71);
call oracle_save_s(71);
call pack(71);
call save_s(71, 0, '[25, 55)');

\echo 'test-72 - [scso]'
insert into s(id, value, valid_period) values (72, 4, '[75, 80)');
insert into s(id, value, valid_period) values (72, 0, '[55, 60)');
insert into s(id, value, valid_period) values (72, 2, '[10, 15)');
insert into s(id, value, valid_period) values (72, 1, '[20, 30)');
call unpack(72);
call oracle_save_s(72);
call pack(72);
call save_s(72, 0, '[25, 55)');

\echo 'test-73 - [scsc]'
insert into s(id, value, valid_period) values (73, 4, '[75, 80)');
insert into s(id, value, valid_period) values (73, 0, '[55, 60)');
insert into s(id, value, valid_period) values (73, 2, '[10, 15)');
insert into s(id, value, valid_period) values (73, 0, '[20, 25)');
call unpack(73);
call oracle_save_s(73);
call pack(73);
call save_s(73, 0, '[25, 55)');

\echo 'test-74 - [scss]'
insert into s(id, value, valid_period) values (74, 4, '[75, 80)');
insert into s(id, value, valid_period) values (74, 0, '[55, 60)');
insert into s(id, value, valid_period) values (74, 2, '[10, 15)');
insert into s(id, value, valid_period) values (74, 1, '[ 0,  5)');
call unpack(74);
call oracle_save_s(74);
call pack(74);
call save_s(74, 0, '[25, 55)');

\echo 'test-75 - [ssoo]'
insert into s(id, value, valid_period) values (75, 4, '[75, 80)');
insert into s(id, value, valid_period) values (75, 3, '[65, 70)');
insert into s(id, value, valid_period) values (75, 2, '[30, 40)');
insert into s(id, value, valid_period) values (75, 1, '[20, 30)');
call unpack(75);
call oracle_save_s(75);
call pack(75);
call save_s(75, 0, '[25, 55)');

\echo 'test-76 - [ssoc]'
insert into s(id, value, valid_period) values (76, 4, '[75, 80)');
insert into s(id, value, valid_period) values (76, 3, '[65, 70)');
insert into s(id, value, valid_period) values (76, 2, '[30, 40)');
insert into s(id, value, valid_period) values (76, 0, '[20, 25)');
call unpack(76);
call oracle_save_s(76);
call pack(76);
call save_s(76, 0, '[25, 55)');

\echo 'test-77 - [ssos]'
insert into s(id, value, valid_period) values (77, 4, '[75, 80)');
insert into s(id, value, valid_period) values (77, 3, '[65, 70)');
insert into s(id, value, valid_period) values (77, 2, '[30, 40)');
insert into s(id, value, valid_period) values (77, 1, '[ 0,  5)');
call unpack(77);
call oracle_save_s(77);
call pack(77);
call save_s(77, 0, '[25, 55)');

\echo 'test-78 - [sscs]'
insert into s(id, value, valid_period) values (78, 4, '[75, 80)');
insert into s(id, value, valid_period) values (78, 3, '[65, 70)');
insert into s(id, value, valid_period) values (78, 0, '[20, 25)');
insert into s(id, value, valid_period) values (78, 1, '[ 0,  5)');
call unpack(78);
call oracle_save_s(78);
call pack(78);
call save_s(78, 0, '[25, 55)');

\echo 'test-79 - [ssso]'
insert into s(id, value, valid_period) values (79, 4, '[75, 80)');
insert into s(id, value, valid_period) values (79, 3, '[65, 70)');
insert into s(id, value, valid_period) values (79, 2, '[10, 15)');
insert into s(id, value, valid_period) values (79, 1, '[20, 30)');
call unpack(79);
call oracle_save_s(79);
call pack(79);
call save_s(79, 0, '[25, 55)');

\echo 'test-80 - [sssc]'
insert into s(id, value, valid_period) values (80, 4, '[75, 80)');
insert into s(id, value, valid_period) values (80, 3, '[65, 70)');
insert into s(id, value, valid_period) values (80, 2, '[10, 15)');
insert into s(id, value, valid_period) values (80, 0, '[20, 25)');
call unpack(80);
call oracle_save_s(80);
call pack(80);
call save_s(80, 0, '[25, 55)');

\echo 'test-81 - [ssss]'
insert into s(id, value, valid_period) values (81, 4, '[75, 80)');
insert into s(id, value, valid_period) values (81, 3, '[65, 70)');
insert into s(id, value, valid_period) values (81, 2, '[10, 15)');
insert into s(id, value, valid_period) values (81, 1, '[ 0,  5)');
call unpack(81);
call oracle_save_s(81);
call pack(81);
call save_s(81, 0, '[25, 55)');

select id as "failed_tests"
  from (select distinct unnest(array[s.id, packed.id]) id
          from s
          full outer join packed using (id, value, valid_period)
         where s.id is null or packed.id is null) x
 where x is not null



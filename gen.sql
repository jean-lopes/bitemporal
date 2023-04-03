drop table if exists relationships cascade;

create table relationships(name text not null primary key);

insert into relationships(name)
values ('overlapped')
     , ('connected')
     , ('separated');

create view truth_table as
    select null as row4
         , null as row3
         , null as row2
         , a.name as row1
    from relationships a
    union all
    select null as row4
         , null as row3
         , a.name as row2
         , b.name as row1
    from relationships a
    cross join relationships b
    union all
    select null as row4
         , a.name as row3
         , b.name as row2
         , c.name as row1
    from relationships a
    cross join relationships b
    cross join relationships c
    union all
    select a.name as row4
         , b.name as row3
         , c.name as row2
         , d.name as row1
    from relationships a
    cross join relationships b
    cross join relationships c
    cross join relationships d
/
-- base record id: 1, value: 10, valid: [100,200)
--
/

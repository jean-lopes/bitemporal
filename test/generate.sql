drop table if exists relationships cascade;

create table relationships(name text not null primary key);

insert into relationships(name)
values ('overlapped')
     , ('connected')
     , ('separated');

create or replace view truth_table as
   with x as (
       select row_number() over() as "test_id"
            , records
            , row4
            , row3
            , row2
            , row1
         from (
             select null as row4
                  , null as row3
                  , null as row2
                  , null as row1
                  , 0 as records
              union all
             select null as row4
                  , null as row3
                  , null as row2
                  , a.name as row1
                  , 1 as records
               from relationships a
              union all
             select null as row4
                  , null as row3
                  , a.name as row2
                  , b.name as row1
                  , 2 as records
               from relationships a
              cross join relationships b
              union all
             select null as row4
                  , a.name as row3
                  , b.name as row2
                  , c.name as row1
                  , 3 as records
               from relationships a
              cross join relationships b
              cross join relationships c
              union all
             select a.name as row4
                  , b.name as row3
                  , c.name as row2
                  , d.name as row1
                  , 4 as records
               from relationships a
              cross join relationships b
              cross join relationships c
              cross join relationships d) x
              where not (   x.row1 is not null
                        and x.row1 in ('overlapped', 'connected')
                        and x.row2 is not null
                        and x.row2 = 'connected')
                and not (   x.row4 is not null
                        and x.row4 in ('overlapped', 'connected')
                        and x.row3 is not null
                        and x.row3 = 'connected')
   )
   select 'generated-' || lpad(test_id::text, (select length(count(*)::text) from x), '0') as "test_id"
        , records
        , row4
        , row3
        , row2
        , row1
     from x;

create or replace view generate_test_data as
    select test_id
         , left(coalesce(row4, '-'), 1) || left(coalesce(row3, '-'), 1) || left(coalesce(row2, '-'), 1) || left(coalesce(row1, '-'), 1) as "code"
         , records
         , 'insert into s(id, value, valid_period) values ' as "prefix"
         , case row4
             when 'overlapped' then '('''|| test_id ||''', 4, ''[50, 60)'');'
             when 'connected'  then '('''|| test_id ||''', 0, ''[55, 60)'');'
             when 'separated'  then '('''|| test_id ||''', 4, ''[75, 80)'');'
             else null
           end row4
         , case row3
             when 'overlapped' then '('''|| test_id ||''', 3, ''[40, 50)'');'
             when 'connected'  then '('''|| test_id ||''', 0, ''[55, 60)'');'
             when 'separated'  then '('''|| test_id ||''', 3, ''[65, 70)'');'
             else null
           end row3
         , case row2
             when 'overlapped' then '('''|| test_id ||''', 2, ''[30, 40)'');'
             when 'connected'  then '('''|| test_id ||''', 0, ''[20, 25)'');'
             when 'separated'  then '('''|| test_id ||''', 2, ''[10, 15)'');'
             else null
           end row2
         , case row1
             when 'overlapped' then '('''|| test_id ||''', 1, ''[20, 30)'');'
             when 'connected'  then '('''|| test_id ||''', 0, ''[20, 25)'');'
             when 'separated'  then '('''|| test_id ||''', 1, ''[ 0,  5)'');'
             else null
           end row1
         , 'call save_s('''|| test_id ||''', 0, ''[25, 55)'');' command_under_test
      from truth_table;

create or replace view generate_tests as
    select string_agg
           ( '\echo ''' || test_id || ' - [' || code || ']''\n'
             || coalesce(prefix || row4 || '\n', '')
             || coalesce(prefix || row3 || '\n', '')
             || coalesce(prefix || row2 || '\n', '')
             || coalesce(prefix || row1 || '\n', '')
             || 'call unpack('''|| test_id ||''');\n'
             || 'call oracle_save_s('''|| test_id ||''');\n'
             || 'call pack('''|| test_id ||''');\n'
             || command_under_test || '\n'
           , '\n') as "tests"
      from generate_test_data;

select '\set QUIET ''on''\n\ntruncate s;\n\n'
    || tests
    || '\n'
    || 'select id as "failed_tests"\n'
    || '  from (select distinct unnest(array[s.id, packed.id]) id\n'
    || '          from s\n'
    || '          full outer join packed using (id, value, valid_period)\n'
    || '         where s.id is null or packed.id is null) x\n'
    || ' where x is not null\n'
from generate_tests;

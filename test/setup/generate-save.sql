\set QUIET 'on'
with relationships as (
    select 'overlapped' as "name"
    union
    select 'connected'
    union
    select 'separated')
, raw_truth_table as (
    select row_number() over() + 32 as "test_id"
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
                     and x.row3 = 'connected'))
, truth_table as (
    select 'save' ||'-'|| lpad(test_id::text, 3, '0') as "test_id"
         , records
         , row4
         , row3
         , row2
         , row1
      from raw_truth_table)
, test_data as (
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
      from truth_table)
, tests as (
    select string_agg
           ( '\echo ''' || test_id || ' - [' || code || ']''\n'
             || coalesce(prefix || row4 || '\n', '')
             || coalesce(prefix || row3 || '\n', '')
             || coalesce(prefix || row2 || '\n', '')
             || coalesce(prefix || row1 || '\n', '')
             || format( 'call save_s(%s, %s, %s);\n'
                      , quote_literal(test_id)
                      , 0
                      , quote_literal('[25,55)'))
             || format( 'select id, value, valid_period from s where id = %s order by valid_period;\n'
                      , quote_literal(test_id))
           , '\n') as "tests"
      from test_data)
select '\set QUIET ''on''\n\ndelete from s where id like ''generated-save-%'';\n\n'
    || tests
    || '\n'
from tests;

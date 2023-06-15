select * from sample.s order by id, valid_period;
select * from sample_history.s order by id, valid_period;
/
call bitemporal.remove_s($$x.id = '1'$$, '[3, 3]');
/
truncate sample.s cascade;
truncate sample_history.s cascade;
/
create type bitemporal.range_type
    as enum ( 'integer'
            , 'bigint'
            , 'numeric'
            , 'timestamp'
            , 'timestamptz'
            , 'date' );

create or replace function bitemporal.get_range_type
    ( range_type bitemporal.range_type )
    returns text
    language sql
    immutable
    returns null on null input
    return case range_type
               when 'integer'      then 'int4range'
               when 'bigint'       then 'int8range'
               when 'numeric'      then 'numrange'
               when 'timestamp'    then 'tsrange'
               when 'timestamptz'  then 'tstzrange'
               when 'date'         then 'daterange'
           end;

create or replace function bitemporal.get_multirange_type
    ( range_type bitemporal.range_type )
    returns text
    language sql
    immutable
    returns null on null input
    return case range_type
                when 'integer'      then 'int4multirange'
                when 'bigint'       then 'int8multirange'
                when 'numeric'      then 'nummultirange'
                when 'timestamp'    then 'tsmultirange'
                when 'timestamptz'  then 'tstzmultirange'
                when 'date'         then 'datemultirange'
              end;

create table bitemporal.params
    ( id                            boolean generated always as (true) stored unique --make this table accept only one row :)
    , valid_time_name               name
    , valid_time_type               bitemporal.range_type not null
    , system_time_name              name
    , system_time_type              bitemporal.range_type not null
    , system_time_current_time_fn   text not null
    , debug                         boolean not null );

insert into bitemporal.params(valid_time_name, valid_time_type, system_time_name, system_time_type, system_time_current_time_fn, debug)
values ('valid_period', 'integer', 'system_period', 'integer', '', false);

/


/
create table sample.ok
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

create table sample.missing_valid_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , system_period     int4range not null
    , primary key(id, id2)
    , exclude using gist (id with =, id2 with =)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =) );

create table sample.nullable_valid_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range null
    , system_period     int4range not null
    , primary key(id, id2)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

create table sample.valid_time_with_wrong_type
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int8range not null
    , system_period     int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );
/
create table sample.missing_system_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

create table sample.nullable_system_time
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int4range
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );

create table sample.system_time_with_wrong_type
    ( id                int not null
    , id2               int not null
    , value             int not null
    , value2            int not null
    , valid_period      int4range not null
    , system_period     int8range not null
    , primary key(id, id2, valid_period)
    , exclude using gist (id with =, id2 with =, valid_period with &&)
    , exclude using gist (id with =, id2 with =, value with =, value2 with =, valid_period with -|-) );
/
create type bitemporal.table_error
    as enum ( 'missing-valid-time'
            , 'wrong-valid-time-range-type'
            , 'nullable-valid-time'
            , 'missing-system-time'
            , 'wrong-system-time-range-type'
            , 'nullable-system-time'
            , 'missing-primary-key' --TODO
            , 'missing-valid-time-on-primary-key' --TODO
            , 'missing-exclude-overlapped-constraint' --TODO
            , 'missing-exclude-adjacency-constraint' --TODO
            , 'missing-history-table' --TODO
            , 'history-table-not-like-main-table' --TODO
            , 'invalid-table-type' --TODO information_schema.tables.type
            , 'table-not-found'
            );
            -- TODO: foreign key erros?
/
DROP FUNCTION bitemporal.check_valid_time_on_table(name,name);
/

/
delimiter @@@

create or replace function bitemporal.check_table
    ( sch name
    , tbl name )
returns table ( error bitemporal.table_error )
language plpgsql
stable
as $body$
declare
    p bitemporal.params;
    r record;
    t information_schema.tables;
begin
    select *
      into p
      from bitemporal.params;

    if not found then
        raise exception 'empty table bitemporal.params';
    end if;

    select *
      into t
      from information_schema.tables
     where table_schema = sch
       and table_name = tbl;

    if not found then
        error := 'table-not-found';
        return next;
        return;
    end if;

    select c.column_name
         , c.is_nullable
         , c.data_type
      into r
      from information_schema.columns as c
     where c.table_schema = sch
       and c.table_name = tbl
       and c.column_name = p.valid_time_name;

    if not found then
        error := 'missing-valid-time';
        return next;
    end if;

    if found and r.is_nullable <> 'NO' then
        error := 'nullable-valid-time';
        return next;
    end if;

    if found and r.data_type <> bitemporal.get_range_type(p.valid_time_type) then
        error := 'wrong-valid-time-range-type';
        return next;
    end if;

    select c.column_name
         , c.is_nullable
         , c.data_type
      into r
      from information_schema.columns as c
     where c.table_schema = sch
       and c.table_name = tbl
       and c.column_name = p.system_time_name;

    if not found then
        error := 'missing-system-time';
        return next;
    end if;

    if found and r.is_nullable <> 'NO' then
        error := 'nullable-system-time';
        return next;
    end if;

    if found and r.data_type <> bitemporal.get_range_type(p.system_time_type) then
        error := 'wrong-system-time-range-type';
        return next;
    end if;

    return;
end; $body$;
@@@
/
select * from bitemporal.check_table('sample', 'ok');
/

create or replace function bitemporal.has_valid_time
    ( schema_name name
    , table_name  name )
    returns boolean
    language sql
    stable
    returns null on null input
    as $$select * from generate_series(1,10)$$;

/

create or replace function bitemporal.bitemporal_tables
    ( schema_name name )
    returns table ( bitemporal_table regclass )
    language sql
    stable
    returns null on null input
    as $$select * from generate_series(1,10)$$;

/
select * from bitemporal.bitemporal_tables('public');
/
select * from information_schema.tables
where table_schema = 'sample'
  AND table_type = 'BASE TABLE';
/
select * from information_schema.columns
where table_schema = 'sample' and table_name = 'nullable_valid_time';
/

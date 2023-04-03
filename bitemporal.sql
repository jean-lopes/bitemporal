drop table s cascade;

create table s
  ( id                 int not null
  , value              int not null
  , valid_period       int4range not null
  , transaction_period int4range not null default int4range(0, null)
  , primary key(id, valid_period)
  , exclude using gist (id with =, valid_period with &&)
  , exclude using gist (id with =, value with =, valid_period with -|-)
  );
 
insert into s(id, value, valid_period)
values(1, 1, '[1,1]');

insert into s(id, value, valid_period)
values(1, 1, '[2,2]');

CREATE OR REPLACE PROCEDURE save_s
    ( id s.id%type
    , value s.value%type
    , valid_period s.valid_period%type
    , where_clause text 
    ) as

$BODY$
     
    insert into s(id, value, valid_period, transaction_period)
    values(id, value, valid_period, tstzrange(now(), 'infinity'));
   
$BODY$ LANGUAGE SQL;



call save_s(1, 1, tstzrange(now(), 'infinity'), NULL);

insert into s_history(id, value, valid_period, transaction_period) values (5, 0, '[0,5)', '[15,20)');

select max(transaction_period) from s;

select x.transaction_period 
from (select lower(transaction_period) from s union select transaction_period from s_history) x 
order by transaction_period desc;

select max(x.val) 
from (
select lower(transaction_period) as val from s 
union
select upper(transaction_period) from s
union 
select lower(transaction_period) from s_history 
union
select upper(transaction_period) from s_history) x;

select coalesce(max(x.val), 0)
from (select lower(transaction_period) as val from s 
union
select upper(transaction_period) from s
union 
select lower(transaction_period) from s_history 
union
select upper(transaction_period) from s_history) x;

create or replace function current_tx_time() 
returns int as 
$BODY$
	select coalesce(max(x.val), 0)
	  from (select lower(transaction_period) as val from s 
	         union
	        select upper(transaction_period) from s
	         union 
	        select lower(transaction_period) from s_history 
	         union
	        select upper(transaction_period) from s_history) x;
$BODY$ language sql;

CREATE OR REPLACE PROCEDURE save_s
    ( id s.id%type
    , value s.value%type
    , valid_period s.valid_period%type
    , where_clause text
    ) as $$ 
declare 
    last_tx integer;
BEGIN
    last_tx := last_tx_time();
    insert into s(id, value, valid_period, transaction_period)
    values(id, value, valid_period, int4range(last_tx + 1, NULL));
END; 
$$ LANGUAGE plpgsql;



select json_to_recordset(*)  from s where valid_period && '[0,5)'

select '[0,5]'::int4range * '[3,8)'::int4range;

DROP PROCEDURE save_s(integer,integer,int4range);

create or replace procedure save_s
    ( s_id                    s.id%type
    , s_value                 s.value%type
    , s_valid_period          s.valid_period%type
    ) as $$
declare
    r s;
    vp s.valid_period%type;
begin
	if isempty(s_valid_period) then
	    raise exception 'empty valid time';
	end if;

    SELECT int4range(min(lower(valid_period)), max(upper(valid_period)))
      into vp
      FROM s
     where id = s_id
       and value = s_value
       and valid_period -|- s_valid_period
     group by id, value;
    
    if vp is not null then
        delete from s where id = s_id and value = s_value and valid_period -|- s_valid_period;
        insert into s(id, value, valid_period) values (s_id, s_value, vp);
        return;
    end if;
   
    FOR r IN 
       SELECT id
            , value
            , valid_period
            , transaction_period
         FROM s
        where id = s_id 
          and valid_period && s_valid_period
    loop
	  vp := r.valid_period - s_valid_period;
	  delete from s where id = r.id and valid_period = r.valid_period;
	  if not isempty(vp) then
	      in5sert into s(id, value, valid_period) values(r.id, r.value, vp);
	  end if;
    END LOOP;
   
    insert into s(id, value, valid_period) values(s_id, s_value, s_valid_period);
end; $$ language plpgsql;

call save_s(0, 0, '[3,13)'::int4range, null);

select * from s order by id,valid_period;

truncate s;
insert into s(id, value, valid_period) values (0, 5, '[0,5)');
insert into s(id, value, valid_period) values (0, 2, '[7,8)');
insert into s(id, value, valid_period) values (0, 3, '[10,15)');













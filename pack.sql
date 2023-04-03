drop table if exists packed cascade;

create table packed (like s);

create or replace procedure pack() as $$
declare
  n int;
begin
  truncate packed;

  insert into packed(id, value, valid_period, transaction_period)
  select id
       , value
       , unnest(range_agg(valid_period)) as valid_period
       , int4range(0, null, '[)')
    from unpacked
   group by id, value
   order by valid_period;
end; $$ language plpgsql;

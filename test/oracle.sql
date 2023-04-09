\set QUIET 'on'

drop table if exists unpacked cascade;
drop table if exists packed cascade;
drop procedure if exists oracle_save_s(s_id s.id%type);

create table unpacked (like s);
create table packed (like s);

alter table unpacked
    add constraint uk_unpacked
    unique (id, valid_period);

create or replace procedure unpack(s_id s.id%type) as $$
declare
  r s;
  l int;
  u int;
  n int;
begin
  delete from unpacked
  where id = s_id;

  for r in (select id
                 , value
                 , valid_period
                 , transaction_period
              from s
             where id = s_id
             order by valid_period)
  loop
    l := lower(r.valid_period);
    u := upper(r.valid_period) - 1;

    if lower_inf(r.valid_period) or upper_inf(r.valid_period) or l = u then
      insert into unpacked(id, value, valid_period, transaction_period)
      values(r.id, r.value, r.valid_period, r.transaction_period);
    else
      for n in select * from generate_series(l, u)
      loop
        insert into unpacked(id, value, valid_period, transaction_period)
        values(r.id, r.value, int4range(n, n, '[]'), r.transaction_period);
      end loop;
    end if;
  end loop;
end; $$ language plpgsql;

create or replace procedure pack(s_id s.id%type) as $$
declare
  n int;
begin
  delete from packed
  where id = s_id;

  insert into packed(id, value, valid_period, transaction_period)
  select id
       , value
       , unnest(range_agg(valid_period)) as valid_period
       , int4range(0, null, '[)')
    from unpacked
   where id = s_id
   group by id, value
   order by valid_period;
end; $$ language plpgsql;

create procedure oracle_save_s(s_id s.id%type) as $$
declare
  r s;
  l int;
  u int;
  n int;
  vp s.valid_period%type;
begin
  for t in 25 .. 54
  loop
    vp := int4range(t, t, '[]');

    insert into unpacked(id, value, valid_period, transaction_period)
    values (s_id, 0, vp, '[1,)')
    on conflict (id, valid_period)
    do update set value = 0;
  end loop;
end; $$ language plpgsql;

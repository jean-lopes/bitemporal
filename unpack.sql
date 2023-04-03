drop table if exists unpacked;

create table unpacked (like s);

create or replace procedure unpack() as $$
declare
  r s;
  l int;
  u int;
  n int;
begin
  truncate unpacked;

  for r in (select id
                 , value
                 , valid_period
                 , transaction_period
              from s
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

-- migrate:up
create or replace function date_diff_minutes(t1 timestamp without time zone, t2 timestamp without time zone, out t_diff real) 
returns real
language plpgsql
AS $function$
begin
	t_diff := (select date_part('year', t1 - t2)*525600 + 
       date_part('month', t1 - t2)*43800 +
       date_part('day',t1 - t2)*1440 +
       date_part('hour', t1 - t2)*60 +
       date_part('minutes', t1 - t2) +
       date_part('seconds', t1 - t2)/60);
end;
$function$
;

-- migrate:down
drop function if exists date_diff_minutes;

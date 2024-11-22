CREATE procedure calculate_amount_by_status(is_ok_arg bool)
language plpgsql as
$$
declare
total numeric := 0;
begin
select sum(amount) into total from zscaler where is_ok = is_ok_arg;
RAISE NOTICE 'total val is % ', total ;
EXCEPTION
WHEN OTHERS THEN
RAISE EXCEPTION 'not valid arg';
END;
$$;

call calculate_amount_by_status(true);

drop procedure calculate_amount_by_status
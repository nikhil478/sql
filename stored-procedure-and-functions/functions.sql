create function square(val int) returns int
language plpgsql as 
$$
declare result int;
begin
result = val*val;
return result;
end;
$$;

select square(10);

drop function square;
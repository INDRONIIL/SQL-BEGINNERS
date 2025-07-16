-- stored procedures --
select *
from employee_salary
where salary >= 50000;

create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

-- call:call is used to call the stored procedures to execute

call large_salaries();


-- In MySQL, a delimiter is used to separate SQL statements,
-- especially within stored procedures, functions, or triggers
-- where multiple statements might be involved. 
DELIMITER $$
create procedure large_salaries2()
BEGIN
	select *
	from employee_salary
	where salary>=50000;
	select *
	from employee_salary
	where salary>10000;
END $$
DELIMITER ;

call large_salaries2();



DELIMITER $$
create procedure large_salaries3(employee_id_parameter int)
BEGIN
	select salary
	from employee_salary
	where employee_id=employee_id_parameter;
END $$
DELIMITER ;

call large_salaries3(1);


DELIMITER $$
create procedure large_Salaries4(employee_id_para int)
BEGIN
	select occupation
    from employee_salary
    where employee_id=employee_id_para;
END $$

DELIMITER ;

call large_Salaries4(2);



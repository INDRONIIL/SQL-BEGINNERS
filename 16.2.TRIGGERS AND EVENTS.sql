-- TRIGGERS AND EVENTS --
select *
from employee_demographics;

select *
from employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON	employee_salary 
    FOR EACH ROW						-- FOR EACH ROW : THE TRIGGERS GONNA GET ACTIVATED ON EACH ROW
BEGIN
INSERT INTO employee_demographics (employee_id,first_name,last_name)
VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id) 
VALUES(13,'INDRONIIL','SIL','CHIEF EXECUTER',200000,null);

delimiter $$
create trigger employee_insert
	after insert on employee_salary
    for each row
begin
insert into employee_demographics(employee_id, first_name, last_name, age)
values(new.employee_id,new.first_name,new.last_name);
end $$
delimiter ;
insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values(15,"VIJAY","PRASAD","MANAGER",100000,9);

-- EVENTS --

select *
from employee_demographics;

delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
 delete
 from employee_demographics
 where age>=60;
end $$

show variables like "event%";


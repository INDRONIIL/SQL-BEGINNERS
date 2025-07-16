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
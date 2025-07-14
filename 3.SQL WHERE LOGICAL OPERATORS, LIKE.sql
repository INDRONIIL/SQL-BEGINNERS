select *
from employee_salary
where first_name='Leslie';

select *
from employee_salary
where salary > 50000;

select * 
from employee_salary
where salary > 70000;

select *
from employee_salary
where salary < 50000;

select *
from employee_salary
where salary <= 50000;

select *
from employee_demographics
where gender='female';

select *
 from employee_demographics
 where gender != 'female';
 
 select *
 from employee_demographics
 where birth_date>'1983-06-14';
 
 -- LOGICAL OPERATORS : AND OR NOT --
 
 select *
 from employee_demographics
 where birth_date > '1983-01-01'
 AND gender='male';
 
 select *
 from employee_demographics
 where birth_date > '1983-01-01'
 OR gender = 'male';
 
 select *
 from employee_demographics
 where birth_date > '1983-01-01'
 OR NOT gender = 'male';
 
SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44)
OR (age > 55);

-- LIKE STATEMENT % and _

select *
from employee_demographics
where first_name like 'A%';

select *
from employee_demographics
where first_name like '%a%';

select *
from employee_demographics
where first_name like 'a__';

select *
from employee_demographics
where first_name like 'a___%'; #after 'a' three spaces then any characters

select *
from employee_demographics
where birth_date like '1980%';


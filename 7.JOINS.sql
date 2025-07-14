-- inner joins --
select * 
from employee_demographics
join employee_salary -- its inner join in default
	ON employee_demographics.employee_id=employee_salary.employee_id; 
    
-- or you can do like this

select *
 from employee_demographics as dem
 join employee_salary as sal
	on dem.employee_id=sal.employee_id;

select dem.employee_id,dem.first_name,dem.last_name,age,occupation
from employee_demographics as dem
join employee_salary as sal
 on dem.employee_id=sal.employee_id;


-- outer joins --
select * from employee_demographics;
select * from employee_salary;

-- LEFT OUTER JOIN - A LEFT OUTER JOIN (or LEFT JOIN) in SQL
-- retrieves all rows from the left table and the matching rows 
-- from the right table. If there's no match in the
-- right table for a row in the left table, NULL values
-- are included for the right table's columns.

select * 
from employee_demographics as dem     -- employee_dem is the left outer join --
left outer join employee_salary as sal -- employee_sal is the right outer join --
	on	dem.employee_id=sal.employee_id;

-- RIGHT OUTER JOIN - A RIGHT OUTER JOIN (or RIGHT JOIN) in SQL retrieves all rows from
-- the right table in a join, and the matching rows from the left table.
-- If there are no matches in the left table for a row in the right table, 
-- those columns will be filled with NULL values. 

select *
from employee_demographics as dem
right outer join employee_salary as sal
	on dem.employee_id=sal.employee_id;
    
    
-- SELF JOIN - A self join in SQL is a regular JOIN operation where a table is joined with itself

select *
from employee_salary as sal1
join employee_salary as sal2
	on sal1.employee_id+1=sal2.employee_id;  
    
select sal1.first_name as first_name_santa,
	   sal1.last_name as last_name_santa,
	   sal1.employee_id as santa_id,
       sal2.first_name as emp_first_name,
	   sal2.last_name as emp_last_name,
	   sal2.employee_id as emp_id
from employee_salary as sal1
join employee_salary as sal2
	on sal1.employee_id+1=sal2.employee_id;
    
-- JOINING MULTIPLE TABLES TOGETHER --
select *
from parks_departments;


select *
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
join parks_departments as pd
	on sal.dept_id=pd.department_id;
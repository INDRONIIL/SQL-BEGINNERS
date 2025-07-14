select *
from employee_demographics as dem
join  employee_salary as sal
	on dem.employee_id=sal.employee_id
where 
	sal.dept_id=1;
    
SELECT *
FROM employee_demographics AS dem
WHERE employee_id IN (
    SELECT sal.employee_id
    FROM employee_salary AS sal
    WHERE sal.dept_id = 1
);

select *
from employee_demographics
where employee_id in(
	select sal.employee_id
	from employee_salary as sal
	where dept_id=1
)
;

select first_name,last_name,salary,(
select avg(salary)
from employee_salary as avg_salary)
from employee_salary;

select gender,avg(age)
from employee_demographics
group by gender;

select avg(max_age)
from (
	select gender,
    avg(age) as avg_age,
    max(age) as max_age,
    min(age) as min_age,
    count(age) as count_age
    from employee_demographics
    group by gender
)as agg_age
;

select gender,avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender;

select avg(max_age)
from (
select gender,
avg(age) as avg_age,
max(age) as max_age,
min(age) as min_age,
count(age)
from employee_demographics
group by gender)as agg_table
;
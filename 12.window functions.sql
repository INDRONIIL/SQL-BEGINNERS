-- WINDOW FUNCTIONS --

select gender,avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
 on dem.employee_id=sal.employee_id
group by gender;


-- over() = This is what makes AVG(salary) a window function rather than a regular aggregate function.
-- When the OVER() clause is empty, it tells SQL to consider the entire result set (all the rows 
-- produced by the JOIN operation) as a single "window."

-- In SQL, the PARTITION BY clause is used with window functions to divide the result set into partitions.

select demo.first_name,demo.last_name,gender,avg(salary) over(partition by gender) 
from employee_demographics as demo
join employee_salary as sal
	on demo.employee_id=sal.employee_id;
-- group by gender;

-- using sum()
-- sum(salary) calculating the salary of all the female and male employees 
-- differently just like cumulitive frequency.
select demo.first_name,demo.last_name,gender,sum(salary) over(partition by gender) 
from employee_demographics as demo
join employee_salary as sal
	on demo.employee_id=sal.employee_id;

-- using order by
-- outputing it like a cumulitive frequency
select demo.first_name,demo.last_name,gender,
sum(salary) over(partition by gender order by demo.employee_id ) as rolling_total
from employee_demographics as demo
join employee_salary as sal
	on demo.employee_id=sal.employee_id; 
    
-- using row_number()
-- generating row numbers like 1 2 3 from the beginning
select demo.first_name,demo.last_name,gender,
row_number() over()
from employee_demographics as demo
join employee_salary as sal
	on demo.employee_id=sal.employee_id;
    
-- using partition by

select demo.first_name,demo.last_name,gender,
row_number() over(partition by gender )
from employee_demographics as demo
join employee_salary as sal
	on demo.employee_id=sal.employee_id;
    
-- using order by

select demo.first_name,demo.last_name,gender,salary,demo.employee_id,
row_number() over(partition by gender order by salary)
from employee_demographics as demo
join employee_salary as sal
	on demo.employee_id=sal.employee_id;

-- using rank()

select demo.employee_id,demo.first_name,demo.last_name,gender,salary,
row_number() over(partition by gender order by salary) as rownumber,
rank() over(partition by gender order by salary) as Ranking,
dense_rank() over(partition by gender order by salary) as Ranking
from employee_demographics as demo
join employee_salary as sal
	on demo.employee_id=sal.employee_id;
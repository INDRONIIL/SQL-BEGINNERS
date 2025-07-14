-- COMMAN TABLE EXPRESSION (CTEs) --
with CTEs_EXAMPLE(GENDER,AVG_SAL,MAX_SAL,MIN_SAL,COUNT_SAL) AS(
select gender,avg(salary) as avg_sal,max(salary) as max_sal,min(salary) as min_sal,count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
)
select *
from CTEs_EXAMPLE
;

with CTE_EXAMPLE AS(
select gender,avg(salary) as avg_sal,max(salary) as max_sal,min(salary) as min_sal,count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
)
select avg(avg_sal) -- avg of avgsal of both
from  CTE_EXAMPLE;

with cte_example as(
	select employee_id,gender,birth_date
	from employee_demographics
	where birth_date > 1985-01-01
),
cte_example2 as (
	select employee_id,salary
    from employee_salary
    where salary>50000
)
select * 
from cte_example as dem
join cte_example2 as sal
	on dem.employee_id=sal.employee_id;
    














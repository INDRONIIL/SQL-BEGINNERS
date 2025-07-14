-- union sql --

select first_name,last_name,'old man' as label from employee_demographics
where age>40 and gender='male'
union
select first_name,last_name,'old lady' as label from employee_demographics
where age>40 and gender='female'
union
select first_name,last_name,'HIGH PAYABLE EMPLOYEE' as label from employee_salary
where salary>70000;


select first_name,last_name,'old man' as label from employee_demographics
where age>40 and gender='male'
union
select first_name,last_name,'old lady' as label from employee_demographics
where age>40 and gender='female'
union
select first_name,last_name,'HIGH PAYABLE EMPLOYEE' as label from employee_salary
where salary>70000 
order by first_name,last_name;
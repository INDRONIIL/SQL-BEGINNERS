select * 
from employee_demographics;

select first_name,last_name,age,(age+10)
from employee_demographics;

select distinct first_name
from employee_demographics;

select distinct gender
from employee_demographics;

select * from employee_salary;

select distinct occupation
from employee_salary;

select *
from employee_demographics
where first_name='Tom';

select * 
from employee_salary
where salary >70000;

select * 
from employee_salary
where salary<=55000;

select * from employee_demographics 
where gender='female';

select * 
from employee_demographics
where birth_date>'1980_01_01'
or not gender='male';

select *
from employee_demographics
where first_name like '%A%';

select *
from employee_demographics
where first_name like 'A___%';

select gender,first_name
from employee_demographics
group by gender,first_name;

select gender,avg(age)
from employee_demographics
group by gender;

select gender,age
from employee_demographics
order by gender,age desc;
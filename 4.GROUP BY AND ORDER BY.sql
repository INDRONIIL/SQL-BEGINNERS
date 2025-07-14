-- GROUP BY--
select *
from employee_demographics;

select gender
from employee_demographics
group by gender;

select gender,avg(age)
from employee_demographics
group by gender;

select gender,avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender;

-- ORDER BY --

select *
from employee_demographics
order by first_name; # ASC BY DEFAULT

select * 
from employee_demographics
order by gender,age,first_name,last_name;

select * 
from employee_demographics
order by gender,age DESC; #in descending order

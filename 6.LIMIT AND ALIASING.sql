-- list and aliasing --
select *
from employee_demographics
order by age desc
limit 3,2;
#orderby age makes it desc 
-- limit--
-- Order the results by age in descending order.
-- Skip the first 2 rows.
-- Return the next 1 row.

-- Aliasing --

select gender,avg(age) as AVERAGE_AGE
from employee_demographics
group by gender
having AVERAGE_AGE > 40;



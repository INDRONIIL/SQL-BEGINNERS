-- HAVING AND WHERE CLAUSE--

#The WHERE clause filters individual rows based on specified conditions 
#before any grouping, while the HAVING clause filters groups of rows based
# on conditions applied after the grouping is performed

select occupation,avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary)>75000;



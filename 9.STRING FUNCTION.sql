-- string function --
select length('INDRONIIL');

select first_name,length(first_name)
from employee_demographics
order by length(first_name);

select upper('sky'); --  upper case --
select lower('SKY');-- loweer case --

select upper(first_name),upper(last_name)
from employee_demographics; 

select trim('            SKY                  '); -- removes the white spaces
select ltrim('          SKY                 '); -- removes left spaces
select rtrim('                sky                      '); -- removes right spaces

select first_name,left(first_name,4),
right(last_name,4),
substring(first_name,3,2) as sliced -- started from the third character then rakes two characters and executed --
from employee_demographics;
 -- keeps the first 4 characters from left and removes all the rest characters same as for right --
select left(first_name,4),
right(last_name,4),
substring(first_name,2,4) as sliced,
substring(birth_date,6,2) as birth_month
from employee_demographics;

-- REPLACE --	
-- REPLACES THE OLDCHARACTERS WITH THE NEW CHARACTERS YOU WANT(CHECT THE UPPER AND LOWER CASES) --
select first_name,replace(first_name,'A','z') 
from employee_demographics;

-- locate --
select locate('x','Alexander');

select	first_name,locate ('An',first_name)
from employee_demographics;

-- concat --
select first_name,last_name,
concat(first_name,last_name)
from employee_demographics;
--
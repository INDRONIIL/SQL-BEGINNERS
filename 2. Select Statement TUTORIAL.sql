SELECT *
FROM employee_demographics;

SELECT first_name,last_name,age,(age+10)*10+10
FROM employee_demographics;

SELECT distinct first_name,last_name,gender
FROM employee_demographics;

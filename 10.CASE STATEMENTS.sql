-- CASE STATEMENTS --

select first_name,last_name,age,
case
	when age<=30 then 'YOUNG EMPLOYEE'
    when age<=50 then 'HALF OLD EMPLOYEE'
    when age>50 then 'OLD EMPLOYEE'
end as AGE_TYPES
from employee_demographics;


select first_name,last_name,salary,
case
	when salary<50000 then salary+(salary*0.05)
    when salary>50000 then salary+(salary*0.07)
end as SALARY_AFTER_ADDING_BONUS,
case
	when dept_id = 6 then salary+(salary*0.10)
end as FINANCE_PERSON_BONUS
FROM EMPLOYEE_SALARY;
create temporary table tempo(
	SName varchar (10),
    Age varchar (10),
    Fav_food varchar (10)
);
INSERT INTO TEMPO VALUES('Indroniil',20,'MOMO');
INSERT INTO tempo VALUES ('Priya', 25, 'Pizza');
INSERT INTO tempo VALUES ('Rahul', 30, 'Biryani');
INSERT INTO tempo VALUES ('Shreya', 22, 'Sushi');

select *
from tempo;

create temporary table salary_more_50k
select *
from employee_salary
where salary >50000;

select *
from salary_more_50k;
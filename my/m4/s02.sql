-- examples on aggregate functions
use hron;

-- count, count distinct, valori buoni della colonna
select count(*), count(manager_id), count(distinct manager_id), count(commission)
from employee;

-- max, min
select max(salary), min(salary)
from employee;

-- min, max on dates
select min(hired), max(hired)
from employee;

-- sum
select sum(salary)
from employee
where department_id = 5;

-- average, se volevo vedere i salari per tutti i dipartimenti usavo group by, vedi s3
select round(avg(salary), 2)
from employee
where department_id = 5;

-- utile per avere statistiche all'interno del dipartimento. uso group by per vederli di tutti i dipartimenti
-- se non lo avessi fatto avrebbe fatto una media di tutta la colonna salario ma non ha senso se metto altre colonne dopo
-- non rispecchierebbe la realtà, metterebbe 9000 come media e poi dipartimento_id 9 ma 9000 non è la media del dipartimento 9
-- altri database crashano
select round(avg(salary), 2) as "media", department_id
from employee
group by department_id
order by salary desc;

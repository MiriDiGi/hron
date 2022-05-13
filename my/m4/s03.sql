-- examples on group by - having
use hron;

-- grouping by department and then by job
-- crea due gruppi uno per department_id e uno job_id, es: se voglio vedere dove mi conviene lavorare e con che lavoro, se non avessi fatto il group by sarebbe sembrato conveniente lavorare nel dipartimento
-- 9 ma se lavoro con il job_id 2 nel dipartimento 9 guadagno meno che se lavoro con il job_id 1 
select round(avg(salary)) as salary, department_id, job_id
from employee
group by department_id, job_id;

-- with a join the result set becomes more interesting
select d.name as Department, j.title as 'Job Title'
from department d right outer join employee e using (department_id)
	join job j using (job_id)
group by department_id, job_id;

-- average salary for all the employees
select round(avg(salary), 2) as 'avg salary'
from employee;

-- average salary for each department
-- se raggruppo per il department_id posso mettere nel select solo lui o QUELLO CHE DIPENDE DA LUI
select department_id, round(avg(salary)) as 'avg salary'
from employee
group by department_id
order by 2 desc;

-- average salary for each department, only for most junior employees
-- prima filtro poi raggruppo
select d.name, round(avg(e.salary)) as 'avg salary'
from employee e left outer join department d using (department_id)
where e.hired > '2019-12-31'
group by e.department_id;

-- quanti sono gli stati appartenenti alle diverse regioni
select count(*) as "states_number", r.name
from country c join region r
on c.region_id = r.region_id
group by c.region_id;
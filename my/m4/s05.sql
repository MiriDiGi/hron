-- examples on subquery
use hron;

-- A) Employees in the IT department

-- A1) Get the id of the IT department, then query the employee table
-- prendi mostra il dipartimento IT
select department_id
from department
where name = 'IT';

-- mostra i dipendenti che hanno department_id it (6)
select concat(first_name, ' ', last_name) as IT
from employee
where department_id = 6;

-- A2) Same, but with a join
select concat(e.first_name, ' ', e.last_name) as IT
from employee e join department d
using (department_id)
where d.name = 'IT';

-- A3) Same, but with a subquery
select concat(first_name, ' ', last_name) as IT
from employee
where department_id in (
	select department_id
	from department
	where name = 'IT'
);

-- B) Who is the John Chen's manager?

-- B1) Given the manager id ...
select manager_id
from employee
where first_name = 'John' and last_name = 'Chen';

-- It is easy to write a plain query to get Nancy Greenberg
select concat(first_name, ' ', last_name) as Manager
from employee
where employee_id = 108;

-- B2) Same, but using a self join
select concat(m.first_name, ' ', m.last_name) as Manager
from employee e join employee m
on e.manager_id = m.employee_id
where e.first_name = 'John' and e.last_name = 'Chen';

-- B3) Same, but using a subquery
select concat(first_name, ' ', last_name) as Manager
from employee
where employee_id = (
	select manager_id
	from employee
	where first_name = 'John' and last_name = 'Chen');

-- B4) safer version using "in" and checking for null
select concat(first_name, ' ', last_name) as Manager
from employee
where employee_id in (
	select manager_id
	from employee
	where first_name = 'John' and last_name = 'Chen' and manager_id is not null);

-- C) managers of employees having last name starting with 'K'
select first_name, last_name
from employee
where employee_id in (
	select manager_id
	from employee
	where last_name like 'K%' and manager_id is not null);

-- D) subquery in select - group by - having + another one in select - from
-- D1) average salaries for each department
select avg(salary)
from employee
group by department_id
order by 1 desc;

-- D2) highest salary among the average salary for each department
select max(tmp.avg_sal) from (
	select avg(salary) avg_sal
	from employee
	group by department_id) tmp;

-- D3) average salaries for each department (no null), excluding the topmost one
select department_id, round(avg(salary))
from employee
group by department_id having avg(salary) < (select max(x.sal) from (
	select avg(salary) sal
	from employee
	group by department_id) x
    where department_id is not null)
order by 2 desc;

-- E) how many countries for each region
-- subquery in select - from - join
select name, c.country_count
from region natural join (
    select region_id, count(*) country_count
    from country
    group by region_id) c;

select r.name, count(*)
from country c join region r
using (region_id)
group by c.region_id;

-- slario max, min, avg, sum employee
select max(salary) as "max", min(salary) as "min", sum(salary) as "sum", truncate(avg(salary), 2) as "avg"
from employee;

-- slario max, min, avg, sum employee
select max(salary) as "max", min(salary) as "min", sum(salary) as "sum", truncate(avg(salary), 2) as "avg", j.title
from employee e join job j
on e.job_id = j.job_id
group by e.job_id
order by j.title;

-- sum dip per lav
select count(employee_id) as "conto", j.title
from employee e join job j
using (job_id)
group by e.job_id;

-- contare solo programmatori
select count(employee_id) as "conto", j.title
from employee e join job j
using (job_id)
group by e.job_id
having j.title = "programmer";

-- contare manager
select count(distinct manager_id) as "conto"
from employee;

-- Nome dei dipendenti che non sono manager
select e.first_name, e.last_name
from employee e join employee m
on e.manager_id = m.employee_id
where m.manager_id is not null and e.manager_id = m.employee_id;
-- o
select first_name, last_name
from employee e
where employee_id not in (
	select distinct manager_id
    from employee e
    where manager_id is not null);

-- differenza
select max(salary) - min(salary) as "diff", job_id
from employee
group by job_id
having diff != 0;

-- min sal, dip group man (non chi non è mam), no grup sal inf 6000
select min(salary), manager_id
from employee
where manager_id is not null
group by manager_id
having min(salary) >= 6000;

-- indirizzi loc e country
select l.street_address, l.city, c.name
from location l join country c
using (country_id)
where c.name = "canada";

-- nome e cogn dip e dep
select e.first_name, e.last_name, d.name, l.city
from employee e join department d
using (department_id)
join location l
using (location_id)
group by employee_id
having l.city = "toronto";

select hired
from employee e
where e.first_name = "david" and e.last_name = "lee";

select first_name, last_name
from employee
where hired > (select hired
from employee e
where e.first_name = "david" and e.last_name = "lee");

-- Nome e cognome dei dipendenti, assunti dopo David Lee (con join)
select e.first_name, e.last_name
from employee e join employee dl
on dl.first_name = "david" and dl.last_name = "lee"
where e.hired > dl.hired;

select e.first_name, e.last_name
from employee e join employee m
on e.manager_id = m.employee_id
where e.hired < m.hired;


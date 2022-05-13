-- examples on non-equi join
use hron;

-- ex 1
-- name of department for a given employee
select e.first_name, e.last_name, d.name
from department d join employee e
using (department_id)
where e.employee_id = 107;

-- name of other department for a given employee
-- vedere in quali dipartimenti non lavora Diana Lorentz
-- nel where prendo tutto tranne il 107
select d.name
from department d join employee e
on d.department_id != e.department_id
where e.employee_id = 107;

-- name of other active department for a given employee
select d.name
from department d join employee e
on d.department_id != e.department_id
where e.employee_id = 107 and d.manager_id is not null;

-- Diana vuole cambiare lavoro e andare Seattle
select d.name
from department d join employee e
on d.department_id != e.department_id
where e.employee_id = 107 and d.location_id = 8;

-- ex 2
-- given an employee, seleziono tutto di Diana Lorentz
select e.first_name, e.last_name, e.salary, j.title, j.job_id, j.min_salary, j.max_salary
from employee e join job j
using (job_id)
where employee_id = 107;

-- ... list of jobs with a compatible min/max salary
select j.title, j.min_salary, j.max_salary
from employee e join job j
on e.salary between j.min_salary and j.max_salary
where e.employee_id = 107;

-- ... list of _other_ jobs with a compatible min/max salary
select j.title, j.min_salary, j.max_salary
from employee e join job j
on e.salary between j.min_salary and j.max_salary
where e.employee_id = 107 and e.job_id != j.job_id;

-- join tra emoloyee e department
select e.first_name, e.last_name, d.name
from employee e join department d
on e.department_id = d.department_id
order by 1;

-- join tra employee e job
select e.first_name, e.last_name, j.title
from employee e join job j
on j.job_id = e.job_id
order by 1;

-- join employee e job (c'è qualcuno che ha il salario che corrisponde al minimo e il massimo per il suo lavoro?)
select e.first_name, e.last_name, e.salary, j.title
from employee e join job j
on j.job_id = e.job_id
where e.salary = j.min_salary or e.salary = j.max_salary;

-- join employee department location
select e.first_name, e.last_name, l.country_id
from location l join department d
on l.location_id = d.location_id
join employee e 
on d.department_id = e.department_id
where l.country_id = "uk"
order by e.first_name, e.last_name;

select m.first_name, m.last_name, d.name, d.department_id
from employee m join department d
on m.employee_id = d.manager_id;

select m.first_name, m.last_name, d.name, d.department_id
from employee m right join department d
on m.employee_id = d.manager_id
order by m.first_name, m.last_name;

-- dipartimenti che non hanno un manager!
select d.name
from department d
where d.manager_id is null;

-- self join
select e.first_name, e.last_name, m.first_name, m.last_name 
from employee e join employee m
on e.manager_id = m.employee_id
order by e.first_name;

-- esercizio many to many!
select c.name as "car", s.name as "name_service", cs.checkin, cs.checkout
from car c join car_service cs
on c.car_id = cs.car_id
join service s
on s.service_id = cs.service_id
where c.name = "silver hornet";

-- salario con aumento 8.5%, usiamo round per togliere i decimali
select first_name, last_name, salary, round (salary/100 * 8.5) as "increase", round ((salary/100 * 8.5) + salary) as "result"
from employee
order by salary desc;

-- giorni passati dall'assunzione
select first_name, last_name, hired, datediff(curdate(), hired) as "differenza"
from employee
order by 3;

-- commissione, se il primo argomento è null torna il secondo argomento
select first_name, last_name, ifnull(commission, "no value") as "commission"
from employee
order by 3;

-- fatta con la in not null
select first_name, last_name, commission
from employee
where commission is not null
union
select first_name, last_name, "no value" as commission
from employee
where commission is null
order by 1, 2;
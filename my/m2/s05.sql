-- examples on join on 3 tables
use hron;

-- extra info on employees - SQL/92
select e.first_name, e.last_name, d.name as department, l.city
from employee e join department d using (department_id)
	join location l using (location_id);

-- extra info on employees - classic
select e.first_name, e.last_name, d.name as department, l.city
from employee e, department d, location l
where d.department_id = e.department_id and d.location_id = l.location_id;

-- employees based at Toronto
select e.first_name, e.last_name, d.name as department
from employee e join department d using (department_id)
	join location l using (location_id)
where l.city = 'Toronto';

-- extra info on executive employees
select first_name, last_name, city
from employee join department using (department_id)
	join location using (location_id)
where name = 'Executive';

-- extra info on executive employees (classic)
select e.first_name, e.last_name, l.city
from employee e, department d, location l
where d.department_id = e.department_id
	and d.location_id = l.location_id
    and d.name = 'Executive';

-- join on a many to many relation
select c.name as "car", s.name as "car_service"
from car c join car_service cs using (car_id)
	join service s using (service_id);

-- unire tre tabelle
select e.first_name, e.last_name, l.city, l.street_address
from employee e join department d
using (department_id)
join location l 
using (location_id)
where e.last_name = "king";

select l.street_address, l.city, c.name, r.name
from region r join country c
using (region_id)
join location l
using (country_id)
where r.name = "europe"
order by c.name, l.city;

select e.first_name, e.last_name, d.department_id, d.name 
from department d join employee e
on d.department_id = e.department_id
where d.name = "it";

select e.first_name, e.last_name, c.name
from employee e join car c
on e.employee_id = c.employee_id;

select e.first_name, e.last_name, l.city
from location l join department d
on l.location_id = d.location_id
join employee e
on d.department_id = e.department_id
where l.city = "london";

select l.street_address, l.city, c.name "states", r.name as "region"
from location l join country c
on c.country_id = l.country_id
join region r
on r.region_id = c.region_id
where r.name = "americas"
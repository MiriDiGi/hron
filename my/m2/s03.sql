-- examples on inner join: using / on / natural
use hron;

-- pre-SQL/92 join
-- usare where così non si capisce se fare una connesione tra due tabelle o un filtering
select r.name as region, c.name as country
from region r, country c
where r.region_id = c.region_id;

-- join-using, handy
-- join usando il comando join
-- using e on ci dicono come connettere le due tabelle
select r.name as region, c.name as country
from region r join country c
using (region_id);

-- join-on, flexible
select r.name as region, c.name as country
from region r join country c
on r.region_id = c.region_id;

-- !!! here a natural join leads to the wrong result set !!!
-- natural join, nata per semplificare le cose ma rischio creare tabelle vuote
select r.name as region, c.name as country
from region r natural join country c;

select first_name, last_name, name
from employee join department
using (department_id)
where name = "it";
-- o
select e.first_name, e.last_name, d.name
from employee e join department d
on e.department_id = d.department_id
where name = "it";
-- o (caso vecchio)
select e.first_name, e.last_name, d.name
from employee e, department d
where e.department_id = d.department_id and name = "it";

select e.first_name, e.last_name, c.name as "car"
from employee e join car c
on e.employee_id = c.employee_id
order by first_name;
-- o
select e.first_name, e.last_name, c.name as "car"
from employee e join car c
using (employee_id)
order by first_name;
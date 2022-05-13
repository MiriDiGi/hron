-- examples on self join
use hron;

select first_name, last_name
from employee;

-- SQL/92
-- non posso usare using perchè pk e fk hanno nome diverso
-- voglio vedere chi sono i manager e chi i capi
select concat(e.first_name, ' ', e.last_name) as Employee, concat(m.first_name, ' ', m.last_name) as Manager
from employee e join employee m
on e.manager_id = m.employee_id
order by 1;

-- "classic"
select concat(e.first_name, ' ', e.last_name) as Employee, concat(m.first_name, ' ', m.last_name) as Manager
from employee e, employee m
where e.manager_id = m.employee_id
order by 1;


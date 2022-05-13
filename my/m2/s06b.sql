-- examples on left/right outer join - from "one" perspective
use hron;

-- Treasury is a department
select department_id, name
from department
where department_id in (11, 12);

-- the inner join skips Treasury
select e.first_name, e.last_name, d.name
from employee e inner join department d
using (department_id)
where d.department_id in (11, 12);

-- right outer join
select e.first_name, e.last_name, d.name
from employee e right outer join department d
using (department_id)
where d.department_id in (11, 12);

-- as above, rewritten as left outer join
select e.first_name, e.last_name, d.name
from department d left outer join employee e
using (department_id)
where d.department_id in (11, 12);

-- voglio vedere anche dipartimenti che non hanno indirizzo (location null), quindi la direzione del join sarà sul department
select l.street_address, l.city, d.name
from location l right join department d
on l.location_id = d.location_id;
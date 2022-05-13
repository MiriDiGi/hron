-- Simplified emulation of full outer join by union
use hron;

-- Left join for department 12 or 'Grant' -> Treasury is missing
select e.first_name, e.last_name, d.name, d.department_id
from employee e left outer join department d
using (department_id)
where d.department_id = 12 or e.last_name = 'Grant';

-- Right join for department 12 or 'Grant' -> Kimberely is missing
select e.first_name, e.last_name, d.name, d.department_id
from employee e right outer join department d
using (department_id)
where d.department_id = 12 or e.last_name = 'Grant';

-- (Soft) emulation of a FULL OUTER JOIN
	select e.first_name, e.last_name, d.name, d.department_id
	from employee e left outer join department d
	using (department_id)
	where d.department_id = 12 or e.last_name = 'Grant'
union
	select e.first_name, e.last_name, d.name, d.department_id
	from employee e right outer join department d
	using (department_id)
	where d.department_id = 12 or e.last_name = 'Grant';

	select d.name, l.city
    from department d left join location l
    on l.location_id = d.location_id
union
	select d.name, l.city
    from department d right join location l
    on l.location_id = d.department_id
    order by name;
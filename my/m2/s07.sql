-- example on union
use hron;

-- two queries on two different tables...
select title, 'job' as origin
from job
where title like 'P%';

select name, 'department'
from department
where name like 'P%';

-- ... could give a combined result set
-- faccio due query diverse e le unisco con union
	select title as name, 'job' as origin
	from job
	where title like 'P%'
union
	select name, 'department'
	from department
	where name like 'P%'
order by name;


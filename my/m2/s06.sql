-- examples on left/right outer join - from "many" perspective
use hron;

-- Kimberely is an employee not associated to a department
-- ha una null nella fk, non è associata al dipartimento
select first_name, last_name, department_id
from employee
where last_name like 'Gr%';

-- the inner join skips Kimberely
-- mostra i dipartimenti in cui lavorano ma il null viene tolto dal result set
select e.first_name, e.last_name, d.name as department
from employee e inner join department d
using (department_id)
where e.last_name like 'Gr%';

-- left outer join preserves Kimberely, giving NULL for the department columns
-- viene mostrata Kimberely, usiamo left perchè mysql ci chiede se ci servono quelle in employee o department
-- con left intendiamo a sinistra del join
select e.first_name, e.last_name, d.name as department
from employee e left outer join department d
using (department_id)
where e.last_name like 'Gr%';

-- rewritten as right outer join
select e.first_name, e.last_name, d.name as department
from department d right outer join employee e
using (department_id)
where e.last_name like 'Gr%';

-- "left" or "right" implies "outer"
select e.first_name, e.last_name, d.name as department
from employee e left join department d
using (department_id)
where e.last_name = 'Grant';

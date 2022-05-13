-- examples on cross join
use hron;

-- cartesian product - following the SQL/92 syntax
-- metodo migliore
select r.name, s.name
from region r cross join service s;

-- cartesian product - non SQL/92 compliant!
select r.name, s.name
from region r join service s;

-- "classic" cartesian product
select r.name, s.name
from region r, service s;
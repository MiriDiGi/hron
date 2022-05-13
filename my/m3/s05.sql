-- examples on regex
use hron;

-- plain LIKE
select last_name
from employee
where last_name like 'A%' or last_name like 'E%'
order by 1;

-- LIKE with regular expression, è la stessa cosa di spora. ^ vuol dire che comincia
select last_name
from employee
where regexp_like(last_name, '^[ae]');

-- rlike vuol dire regexp_like
select last_name
from employee
where last_name rlike '^[ae]'
order by 1;

-- $ vuol dire finisce per
select last_name
from employee
where last_name regexp '[nt]$';

-- * vuol dire o
select first_name, last_name
from employee
where last_name rlike '^c.*[nt]$';

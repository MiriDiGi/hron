-- examples on sorting
use hron;

-- a plain sorted query, non ordinata per nome ma solo per cognome, Geralt e Nanette Cambrault non sono in ordine
select first_name, last_name
from employee
order by last_name;

-- ordering by more columns
-- ordina per cognome, in caso di pareggio ordina anche il cognome. se non lo specifico non lo fa
select last_name, first_name
from employee
order by last_name, first_name;

-- natural order is not always what we want
-- ordine di salario, viene messo in ordine naturale, dal più piccolo al più grande, se voglio il contrario devo usare la 
-- keyword desc, asc (che è ascendente è sottinteso)
select first_name, last_name, salary
from employee
order by salary;

-- descending and limited
select first_name, last_name, salary
from employee
order by salary desc
limit 6;

-- non mette dentro il salario
-- l'ordine in cui si mette è questo per forza:
-- select, from, where, order by, limit
select first_name, last_name
from employee
where first_name like 'b%'
order by salary desc;

-- positional notation
-- invece di ripete il nome della colonna posso usare un indicatore posizionale
select first_name, last_name
from employee order by 1, 2;

-- seleziono nome, cognome e colonna però prendo solo quelli che hanno nome che inizia per c%
-- ordinato per mezzo della terza colonna hired
select first_name, last_name, hired
from employee
where first_name like 'c%'
order by 3 asc;

select first_name, last_name, phone, hired
from employee
order by 2, 1;

-- posso usare anche l'or
select first_name, last_name, phone, hired
from employee
where first_name in ("david", "peter")
order by last_name;

select first_name, last_name, phone, hired
from employee
where department_id = 6;

select first_name, last_name, phone, hired
from employee
where department_id in (3, 5);

select first_name, last_name, phone, hired, salary
from employee
where salary > 10000
order by salary desc;

select first_name, last_name, phone, hired, salary
from employee
where salary < 4000 or salary > 15000
order by salary;

-- devo stare attenta per l'ordine delle operazioni booleani
select first_name, last_name, phone, hired, salary, department_id
from employee
where (salary < 4000 or salary > 15000) and department_id in (5, 8);
-- si può fare anche come qui sotto
select first_name, last_name, phone, hired, salary, department_id
from employee
where (salary not between 4000 and 15000) and department_id in (5, 8);

select *
from employee
where hired like "2015%";
-- o
select *
from employee
where hired between "2015-01-01" and "2015-12-31";

-- job_id
select distinct job_id
from employee
order by job_id;

select *
from employee
where commission is not null
order by commission, last_name;

select *
from employee
where first_name like "%a%" or last_name like "%a%";

select *
from department
order by name;

select *
from location
where country_id = "it";
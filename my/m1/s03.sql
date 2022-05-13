-- examples on select
use hron;

-- select all  in sql li tengono staccati, leggi tutte le colonne e le righe della tabella region
-- null sotto mi permette di inserire righe senza usare sql
select *
from region;

-- selecting a single column and a single row (if exists), se non c'è il where intendo tutte le righe
select name
from region
where region_id = 1;

-- select a single column, no row filtering qui mette anche i duplicati
select manager_id
from employee;

-- selecting only non-duplicated values il primo null è perchè il manager id 100 non ha un manager, distinct mi filtra le righe
select distinct manager_id
from employee;

-- select with changes on values and column names mi creo un result set a partire dalla mia tabella, voglio vedere come sarebbe il doppio del salario minimi
select title, min_salary, min_salary * 2 as 'doubled min salary'
from job;

-- other ways to specify column aliases 
select title, min_salary as min, max_salary max
from job;

-- the dual table and the function current_date posso usare select senza from, current_date è una pseudo colonna, dual è una tabella innesistente
select current_date;
-- from dual;

-- posso fare operazioni, sa che questa è un'operazione non devo spiegargli da dove
select sqrt(25);

-- concatenation  posso mettergli tutti i parametri che voglio separati da virgole, devo mettere un titolo altrimenti è brutta la visualizzazione
select concat(region_id, ': ' ,country_id) as 'the countries'
from country;

-- limit to get a result set with a specified max size, limit non è presente in tutti gli sql voglio vedere nome e cognome dei miei dipendenti, metto i primi 10
-- non sono in ordine, se lo voglio ordinato uso order by
select first_name, last_name
from employee
limit 10;

-- the second block of ten employees, parti da 10 e dammi i 10 successivi utile se voglio ordinare a blocchi di 10
select first_name, last_name
from employee
limit 10, 10;

-- there are less than 110 employees, so this result set is smaller than 10
select first_name, last_name
from employee
limit 100, 10;

-- seleziono nome, cognome numero di una sola persona
select first_name, last_name, phone  
from employee
where employee_id =107;

-- seleziono tutte i John
select *
from employee
where first_name = "john";

-- voglio concatenare nome, cognome e poi voglio vedere la colonna del numero di telefono (concatenazione posso anche non metterlo tra apici dato che è una parola singola)
select concat(first_name, " ", last_name)  as "concatenazione", phone
from employee
where first_name = "john";

-- seleziona employee nome e cognome che hanno manager_id 100
select first_name, last_name
from employee
where manager_id = 100;
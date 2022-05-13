-- examples on comparison operators
use hron;

-- equality
select *
from region
where region_id = 1;

-- difference
select *
from region
where region_id != 2;

-- difference, alternative notation
select *
from region
where region_id <> 2;

-- strictly less than
select *
from region
where region_id < 3;

-- less or equal to
select *
from region
where region_id <= 3;

-- strictly bigger than
select *
from region
where region_id > 3;

-- greater or equal to
select *
from region
where region_id >= 3;

-- simple pattern matching, mi dice che a destra sto cercando un cognome strutturato in questo modo. pattern con due caratteri jolly:
-- _ = un carattere (esattamente uno, SOLO uno!!!)
-- poi ho 3 caratteri u l l
-- % = un solo carattere o più
-- se tolgo il % mi trova solo quello che ha un carattere davanti e poi u l l, quindi Bull
-- "like" a string starting with one char, then "ull", then 0, 1 or more chars
select first_name, last_name
from employee
where last_name like '_ull%';

-- "like" a string having an "m" anywhere, prendi il nome dove il nome ha dentro una m in qualunque posizione, perchè:
-- % = è qualasiasi carattere uno o più
select name
from region
where name like '%m%';

-- "like" a string having a lowercase "m" anywhere
select name
from region
where name like binary '%m%';

-- starting with "a"
-- comincia per A e poi va avanti come gli pare
select first_name, last_name
from employee
where last_name like 'A%';

-- ci sono due lettere singole che non so cosa sono e poi quello che voglio
select first_name, last_name
from employee
where last_name like '__ll%';

-- stessa cosa, tre caratteri singoli
select last_name
from employee
where last_name like '___';

-- implicit cast to string before checking the pattern
-- like usa solo stringhe quindi mi converte la stringa in formato giapponese e confronta con il pattern
select last_name, first_name, hired
from employee
where hired like '2015%';

select last_name, first_name, hired
from employee
where hired like '%-05-%';

-- interval check with "between ... and ..."
-- tutte le colonne per le righe che hanno region_id tra uno e 3
select *
from region
where region_id between 1 and 3;

-- "between" strings
-- compresa tra le stringhe, belgio e cina
select *
from country
where name between 'belgium' and 'china';

-- tutti quelli che iniziano per i fino a quelli che inizino per p
select *
from country
where name between 'i' and 'p';

-- "between" dates
-- per questa stessa query potevo usare un like, il between è comodo per le date intermedie
select last_name, first_name, hired
from employee
where hired between '2015-01-01' and '2015-12-31';

-- check if "in" a set
-- confronta region_id riga per riga accetta quelli che sono nell'insieme
select *
from region
where region_id in (4, 2, 1);

-- "not like"
-- not an "a" anywhere
select name
from region
where name not like '%a%';

-- check if (not) in a set
-- regioni il cui id non è nell'insieme (2, 4)
select *
from region
where region_id not in (2, 4);

-- beware of null
-- se c'è il null spacca tutto, si mangia tutto quello che c'era prima
select *
from employee
where commission not in (.30, .20, null);

-- "is (not) null" is the only way to check it
-- se lavoriamo con i null l'unico modo per farli fuori è questo
select *
from employee
where commission is not null;

-- this one works fine
-- non è un intervallo, o quello che è 0.10 OR quello che è 0.15
select *
from employee
where commission in (0.10, 0.15);

-- can't compare a 'good' value with null
-- non funziona!!! 
select *
from region
where name not in (null) or name in (null);

-- this one works as expected
-- questa è la soluzione di quello sopra
select *
from region
where name is not null or name is null;

select first_name, last_name
from employee
where last_name like "K%";

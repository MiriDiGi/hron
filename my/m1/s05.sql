-- examples on null
use hron;

-- check null, seleziona dalla tabella employee le colonne dove il cognome è king è la commission è null, va usato is null e non = null
select employee_id, first_name, last_name, commission
from employee
where last_name = 'King' and commission is null;

-- !!! WRONG - no row is returned !!!
select employee_id, first_name, last_name, commission
from employee
where last_name = 'King' and commission = null; -- !!! WRONG !!!

-- check not null
select employee_id, first_name, last_name, commission
from employee
where last_name = 'King' and commission is not null;

-- !!! WRONG  - no row is returned !!!
select employee_id, first_name, last_name, commission
from employee
where last_name = 'King' and commission != null;

-- null in operations, null is returned il null si mangia il salario, anche se steven lo ha perchè è moltiplicato per il NULL per fare giusto devo fare come sotto
select first_name, last_name, salary * commission
from employee
where last_name = 'King';

-- using ifnull() to get rid of null controllo se il valore è sicuro o è null, se è buono mi viene ritornato altrimenti mi viene ritornato il secondo elemento
-- è un modo per mascherare gli if, se avessi voluto mettere il salario invece dello 0 avrei messo 1, così esce il salario perchè lo moltiplica per il salario, salario * 1 = salario
-- al posto della commissione posso mettere quello che voglio
select employee_id, first_name, last_name, salary * ifnull(commission, 0) as 'monthly commission'
from employee
where last_name = 'King';

-- compare ifnull() to coalesce()  coalisce è una var args, mi prende tutti i valori e prende il primo che non è null
select ifnull(null, 42), coalesce(null, null, 42);

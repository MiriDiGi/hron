-- examples on update
use hron;

-- check the current table status
describe service;

select s.*, l.city
from service s left outer join location l using (location_id);

-- updating a single row (if found)
-- prendo la parte destra del nome a partire dal carattere 24 e metto location id a 3
-- di service_id 20
-- prima era 20	Mayday Shifty Solutions	2
-- right() e left() right prende tutti i caratteri a destra o a sinistra in base al numero che gli dico nella parentesi
-- ovviamente posso mettere name = "qualsiasicosa!"
-- posso farlo tutte le volte che voglio!!!
-- se metto il numero sbagliato (e non esiste) del where non succede nulla perchè non trova id 
update service
set name = left(name, 13), location_id = 3
where service_id = 20;

-- updating (potentially) more rows
-- mette tutte 10 righe a N/A
update service
set name = 'N/A'
where service_id > 10;

-- updating all rows - by mistake?
-- mette tutti i nomi delle righe mistake!! manca il where
update service
set name = 'mistake!';


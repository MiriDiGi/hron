-- examples on insert
use hron;

-- check the current table status
-- result set che spiega come è fatta la tabella
-- non posso mettere null nella pk
-- MUL vuol dire fk
describe service;

select s.*, l.city
from service s left outer join location l
using (location_id);

-- plain insert
-- nella tabella service, nuova riga: service_id, name, location_id, lo stesso ordine indicato nella clausola
-- deve essere quello del value
-- l'insert non è nel result set ma nella tabella vera vera
insert into service (service_id, name, location_id) values
	(20, 'Mayday Shifty Solutions', 2);

-- multiline insert
-- due righe in un colpo solo
insert into service (service_id, name, location_id) values
	(21, 'Old Gondor Raw Equipment', 3),
	(22, 'Rohan Leather', 4);

-- nullable column could be skipped
-- mette anche i null al posto delle colonne mancanti
insert into service (service_id, name) values
	(23, 'Kerr & Reetch Associates');

-- auto-incremented value for pk
-- si ricorda il numero più grande generato e lo mette dopo
insert into service (name) values
	('Multiple Oz Factories');

-- insert relying on column definition on table
-- cattiva usanza
insert into service
	values (26, 'Rainydays Carwash', null);

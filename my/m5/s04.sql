-- examples on delete
use hron;

-- check the current table status
select *
from service;

-- delete a single row (or none)
delete from service
where service_id = 20;

-- multiline delete - be extra careful with it!
delete from service
where service_id > 10;

-- even more careful here!
-- anyway this statement won't work, for referential integrity problems
-- questo non dovrebbe farlo perchè la tabella car_service fa riferimento alla riga di questa tabella
-- questo perchè deve mantenere l'integrità referenziale (non vuole lasciare orfani)
delete from service;
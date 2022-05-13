-- run it on MySQL as root   sono i commenti di sql
-- creates user and schema hron

drop user if exists hron;   -- elimina l'utente hron se esiste con drop
drop schema if exists hron;     -- elimina lo schema hron se esiste

-- !!! change password !!!
create user hron identified by 'password';  -- crea l'utente hron con la password password
create schema hron;  -- lo schema non ha bisogno di una pass, crea lo schema hron

grant all privileges on hron.* to hron;   -- dai tutti i privilegi a hron ma SOLO sullo schema hron
grant alter routine on hron.* to hron;   -- 

use hron;

DELIMITER //

create procedure drop_fk_if_exists(
	in my_table varchar(64),
    in my_fk varchar(64)
) begin
	if exists(
		select enforced
        from information_schema.table_constraints
		where table_schema = schema() and table_name = my_table and constraint_name = my_fk and constraint_type = 'FOREIGN KEY')
	then
		set @query = concat('ALTER TABLE ', my_table, ' DROP FOREIGN KEY ', my_fk, ';');
 		prepare stmt from @query;
		execute stmt;
		deallocate prepare stmt;
 	end if;
end;

//
DELIMITER ;


-- create table client
create table client (
	client_id integer primary key auto_increment,
	name varchar(50) not null,
	phone varchar(20) not null unique
);
    
    select *
    from client;
    
    -- insert
    insert into client (name, phone)
    values ("Miriam Di Giandomenico", "12345567");
    insert into client (name, phone)
    values ("Federica Di Giandomenico", "34910327");
    
    -- update
    update client
    set name = "Mario Rossini"
    where client_id = 3;
    
	commit;
    
    -- delete
    delete from client
    where client_id = 3;
    
    rollback;
 
 drop table if exists reservation;
 
 -- create table reservation
 create table reservation (
	reservation_id integer primary key auto_increment,
    day timestamp not null,
    count integer not null,
    client_id integer not null, 
    -- creo fk
    foreign key(client_id) references client(client_id)
);

select *
from reservation;

insert into reservation (day, count, client_id) values 
	(now(), 2, 1),
	(now(), 4, 3); 
    
describe reservation;
    
-- aumenta di 100 stipendio David
select *
from employee
where first_name = "david";

update employee
set salary = salary + 100
where first_name = "david"
 
-- customer stored function
create or replace function add_customer(
	_customer_id INTEGER, 
	_first_name VARCHAR, 
	_last_name VARCHAR, 
	_phone_number NUMERIC,
	_email VARCHAR
)
returns void
as $MAIN$
begin 
	insert into customer(customer_id, first_name, last_name, phone_number, email)
	VALUES(_customer_id, _first_name, _last_name, _phone_number, _email);
end;
$MAIN$
language plpgsql;

select add_customer(1, 'Krusty', 'Daclown', 1115559999, 'daclown@clowntown.edu');
select add_customer(2, 'Murphy', 'Brown', 2115559999, 'dabrown@aol.com');

-- salesperson stored function 
create or replace function add_salesperson(
	_salesperson_id INTEGER, 
	_first_name varchar, 
	_last_name VARCHAR, 
	_phone_number NUMERIC,
	_email VARCHAR
)
returns void
as $MAIN$
begin 
	insert into salesperson(salesperson_id, first_name, last_name, phone_number, email)
	VALUES(_salesperson_id, _first_name, _last_name, _phone_number, _email);
end;
$MAIN$
language plpgsql;

select add_salesperson(1, 'Nico', 'Sneeko', 3115559999, 'dasnico@dasneeko.edu');
select add_salesperson(2, 'Sleazy', 'Mcleazy', 6115559999, 'dasleezor@aol.com');

-- mechanic insert
insert into mechanic(
	mechanic_id,
	first_name,
	last_name,
	phone_number,
	email
)VALUES(
	1,
	'Jake',
	'Sully',
	1234567890,
	'jakesully@bluekitty.com'
);

insert into mechanic(
	mechanic_id,
	first_name,
	last_name,
	phone_number,
	email
)VALUES(
	2,
	'Hamster',
	'Hooey',
	1234567891,
	'hamsterho@hamtaro.com'
);

-- vehicle insert
insert into vehicle(
	serial_number,
	make,
	model,
	year
)VALUES(
	'98765432one',
	'simpsons',
	'canyanero', 
	2004
);

insert into vehicle(
	serial_number,
	make,
	model,
	year
)VALUES(
	'9876543two1',
	'honda',
	'fit', 
	2016
);

-- invoice insert
insert into invoice(
	invoice_id,
	price,
	serial_number,
	customer_id,
	salesperson_id
)VALUES(
	1,
	100000.00,
	'9876543two1',
	1,
	1
);

insert into invoice(
	invoice_id,
	price,
	serial_number,
	customer_id,
	salesperson_id
)VALUES(
	2,
	300000.00,
	'98765432one',
	2,
	2
);

select * from invoice;

-- service_ticket insert
insert into service_ticket(
	ticket_id,
	cost,
	serial_number,
	customer_id
)VALUES(
	1,
	5000.00,
	'98765432one',
	2
);

insert into service_ticket(
	ticket_id,
	cost,
	serial_number,
	customer_id
)VALUES(
	2,
	7000.00,
	'9876543two1',
	1
);

-- service_history junction table insert
insert into service_history(
	event_id,
	event_description,
	ticket_id,
	mechanic_id,
	serial_number
)VALUES(
	1,
	'Changed oil. Replaced rear auxillary gasket and front cup holder with a big gulp sized holder',
	1,
	1,
	'98765432one'
);

insert into service_history(
	event_id,
	event_description,
	ticket_id,
	mechanic_id,
	serial_number
)VALUES(
	2,
	'Removed rats nest from radiator',
	2,
	2,
	'9876543two1'
);


-- part table insert
insert into part(
	part_id,
	description,
	ticket_id
)VALUES(
	1,
	'rear auxillary gasket',
	1
);

insert into part(
	part_id,
	description,
	ticket_id
)VALUES(
	2,
	'big gulp sized cup holder',
	1
);


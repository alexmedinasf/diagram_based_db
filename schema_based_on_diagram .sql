-- create data base

CREATE DATABASE "Clinic"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- create tables for database

-- create patients table

create table patients(
	id serial primary key,
	name varchar(255),
	date_of_birth date
);

-- create medical histories table

create table medical_histories(
	id serial primary key,
	admitted_at timestamp,
	patient_id integer references patients(id),
	status varchar(255)	
);

-- traetment table

create table treatment(
	id serial primary key,
	type varchar(255),
	name varchar(255)
);

-- Invoices table

create table invoices (
	id serial primary key,
	total_amount decimal,
	generated_at timestamp,
	payed_at timestamp,
	medical_history_id integer references medical_histories (id)
);

-- invoice_item 

create table invoice_items (
	id serial primary key,
	unit_price decimal,
	quantity integer,
	total_price decimal,
	invoice_id integer references invoices(id),
	treatment_id integer references treatment(id)
);

ALTER TABLE medical_histories add constraint id foreign key (id) references treatment (id);

ALTER TABLE treatment add constraint id foreign key (id) references medical_histories (id);

create table mh_treatment (
	id serial primary key,
	mh_id integer references medical_histories(id),
	treatment_id integer references treatment (id)
);

create index index_mh_id on mh_treatment (mh_id);

create index index_treatment_id on mh_treatment (treatment_id);

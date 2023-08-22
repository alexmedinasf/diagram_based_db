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

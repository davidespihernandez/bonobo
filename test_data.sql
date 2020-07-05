drop table if exists service_record;

drop table if exists customer;

create table customer
(
    id serial PRIMARY KEY,
    name varchar(255) not null
);

drop table if exists service;

create table service
(
    id serial PRIMARY KEY,
    name varchar(255) not null
);

create table service_record
(
    id serial PRIMARY KEY,
    customer_id INTEGER REFERENCES customer(id),
    service_id INTEGER REFERENCES service(id),
    datetime timestamp with time zone not null,
    amount numeric(12,2) not null
);

insert into customer(name) values ('Customer 1');
insert into customer(name) values ('Customer 2');
insert into service(name) values ('Service 1');
insert into service(name) values ('Service 2');

insert into service_record(customer_id, service_id, datetime, amount)
(
    select c.id, s.id, timestamp with time zone '2020-01-01 14:00:00 +02:00', 1.0
    from customer c, service s
);

insert into service_record(customer_id, service_id, datetime, amount)
(
    select c.id, s.id, timestamp with time zone '2020-01-02 14:00:00 +02:00', 1.0
    from customer c, service s
);

insert into service_record(customer_id, service_id, datetime, amount)
(
    select c.id, s.id, timestamp with time zone '2020-01-03 14:00:00 +02:00', 1.0
    from customer c, service s
);


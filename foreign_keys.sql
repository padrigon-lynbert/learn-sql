SELECT * from transactions

-- insert into transactions (amount, customer_id)
-- VALUES
--     (4.22, 1), (22.36, 3), (5.66, 2), (6.66, 1);



-- alter TABLE transactions
-- auto_increment = 1000;

/*
SELECT
    constraint_name
FROM
    information_schema.table_constraints
WHERE
    constraint_type = 'FOREIGN KEY' AND
    table_name = 'transactions';
*/


-- alter table transactions
-- drop foreign key customer_id,
-- drop foreign key transactions_ibfk_1;

-- create table customers(
--     customer_id int primary key auto_increment,
--     first_name varchar(50),
--     last_name varchar(50)
-- );

-- insert into customers (first_name, last_name)
-- values
--     ("Fred", "Fish"),
--     ("Larry", "Lobs"),
--     ("Bubble", "Bass");

-- alter table transactions
-- add constraint fk_customer_id
-- foreign key (fk_customer_id) references customers(customer_id

-- create table transactions(
--     transaction_id int primary key auto_increment,
--     amount decimal(5,2),
--     customer_id int,
--     foreign key(customer_id) references customers(customer_id)
-- );
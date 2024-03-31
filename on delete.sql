-- if fk is deleted replace fk with null or delete the entire row

-- on delete set null, on delete set cascade

-- alter table transactions
-- add constraint fk_customer_id 
-- foreign key(customer_id) references customers(customer_id)
-- on delete set null;
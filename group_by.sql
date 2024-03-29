select sum(amount), customer_id
from transactions
GROUP BY customer_id 
HAVING customer_id is not null

-- sum max min count 

-- insert into transactions
-- VALUES (1005, 26.24, 4, "2023-01-03"),
--     (1006, 30.37, 5, "2023-01-04"),
--     (1007, 10.28, 2, "2023-01-04");

-- update transactions
-- set order_date = "2023-01-04"
-- where transaction_id > 1005

-- update transactions
-- set customer_id = null
-- where transaction_id > 1005

-- alter table transactions
-- rename column date to order_date


-- add date date
select a.id, a.job as "job", concat(a.firstname, " ", a.lastname) as "employees",
    concat(b.firstname, " ", b.lastname) as "managed by", b.job as "report to"
from employees as a 
-- INNER JOIN employees as b 
LEFT JOIN employees as b 
on a.supervisor_id = b.id


-- update employees
-- set job = "assistant manager"
-- where id = 5;
-- alter table employees
-- add supervisor_id int

-- SELECT a.customer_id, a.first_name, a.last_name, 
--     concat(b.first_name, " ", b.last_name) as "referred by"
-- FROM customers as a
-- -- inner join customers as b
-- left join customers as b
-- on a.referral_id = b.customer_id


-- alter table customers
-- add referral_id int

-- update customers
-- set referral_id = 2 where customer_id = 4


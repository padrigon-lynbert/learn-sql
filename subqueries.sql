-- SELECT concat(first_name, " ", last_name)
-- from customers 
-- WHERE customer_id not in
-- (select customer_id
-- from transactions
-- WHERE customer_id is not null)

-- select firstname, lastname, hourly_pay
-- from employees
-- -- SELECT avg(hourly_pay) from employees
-- where hourly_pay > (SELECT avg(hourly_pay) from employees)

-- select firstname, lastname, hourly_pay, 
--     (select avg(hourly_pay) from employees) as "average pay"
-- from employees
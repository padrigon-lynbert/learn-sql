update employees
set hourly_pay = 100
where id = 1

-- create trigger after_salary_update
-- after update on employees
-- for each row
-- update expenses
-- set expense_total = expense_total + (new.salary - old.salary)
-- where expense_name = "salaries"

-- drop trigger after_salary_insert

-- create trigger after_salary_insert
-- after insert on employees
-- for each row
-- update expenses
-- set expense_total = expense_total + new.salary
-- where expense_name = "salaries"

-- delete from employees
-- where id = 6

-- CREATE trigger after_salary_delete
-- after delete on employees
-- for each row
-- update expenses
-- set expense_total = expense_total - old.salary
-- where expense_name = "salaries"

-- update expenses
-- set expense_total = (select sum(salary) from employees)
-- where expense_name = "salaries"

-- INSERT into expenses
-- VALUES
-- (1, "salaries", 0),
-- (2, "supplies", 0),
-- (3, "taxes", 0)

-- create TABLE expenses(
--     expense_id int primary key,
--     expense_name varchar(50),
--     expense_total decimal(10,2)
-- );


-- insert into employees
-- VALUES (6, "Sheldon", "Plankton", 10, null, "janitor", "2023-01-05", 5);

-- delete from employees
-- where id = 6


-- update employees
-- set hourly_pay = hourly_pay + 1

-- show triggers

-- CREATE trigger before_hourly_pay_update
-- before update on employees
-- for each row
-- set new.salary = (new.hourly_pay * 2080)

-- update employees
-- set salary = hourly_pay * 2080

-- alter table employees
-- add column salary decimal(10,2) after hourly_pay


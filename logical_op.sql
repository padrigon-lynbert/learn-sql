select * from employees where (job in ("cook") )
-- select * from employees where (hire_date between "2023-01-02" and "2023-01-04")
-- select * from employees where (job != "manager" and job != "assistant mannager")
-- select * from employees where (job = "manager" || job = "assistant mannager")

-- INSERT into employees
-- VALUES(6, "Sheldon", "Plankton", 10.00, "janitor", "2023-01-05");

-- update employees
-- set job = "assistant mannager" where id = 5


-- alter table employees
-- add column job varchar(50) after hourly_pay


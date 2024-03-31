-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 31, 2024 at 10:01 AM
-- Server version: 8.0.36
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`user1`@`%` PROCEDURE `find_customer` (IN `fname` VARCHAR(50), IN `lname` VARCHAR(50))   BEGIN

    select *
    from customers
    where fist_name = fname and last_name = lname;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customers` ()   BEGIN
    SELECT * FROM customers;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `attendance`
-- (See below for the actual view)
--
CREATE TABLE `attendance` (
`firstname` varchar(20)
,`lastname` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `referral_id` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `referral_id`, `email`) VALUES
(1, 'Fred', 'Fish', NULL, 'ffish@email.com'),
(2, 'Larry', 'Lobs', 1, 'llobster@email.com'),
(3, 'Bubble', 'Bass', 2, 'bbass@email.com'),
(4, 'Popy', 'Puff', 2, 'ppuff'),
(5, 'Pearl', 'Krabs', NULL, 'pkrabs@email.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_email`
-- (See below for the actual view)
--
CREATE TABLE `customer_email` (
`email` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `hourly_pay` decimal(5,2) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `supervisor_id` int DEFAULT NULL
) ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `firstname`, `lastname`, `hourly_pay`, `salary`, `job`, `hire_date`, `supervisor_id`) VALUES
(1, 'Eugene', 'Krabs', 100.00, 208000.00, 'manager', '2023-01-01', NULL),
(2, 'Squidward', 'Tentacles', 16.00, 33280.00, 'cashier', '2023-01-02', 5),
(3, 'Spongebob', 'Squarepants', 13.50, 28080.00, 'cook', '2023-01-03', 5),
(4, 'Patrick', 'Star', 13.50, 28080.00, 'cook', '2023-01-03', 5),
(5, 'Sandy', 'Cheeks', 18.25, 37960.00, 'assistant manager', '2023-01-04', 1),
(6, 'Sheldon', 'Plankton', 10.00, 20800.00, 'janitor', '2023-01-05', 5);

--
-- Triggers `employees`
--
DELIMITER $$
CREATE TRIGGER `after_salary_delete` AFTER DELETE ON `employees` FOR EACH ROW update expenses
set expense_total = expense_total - old.salary
where expense_name = "salaries"

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
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_salary_insert` AFTER INSERT ON `employees` FOR EACH ROW update expenses
set expense_total = expense_total + new.salary
where expense_name = "salaries"

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
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_salary_update` AFTER UPDATE ON `employees` FOR EACH ROW update expenses
set expense_total = expense_total + (new.salary - old.salary)
where expense_name = "salaries"

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
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_hourly_pay_insert` BEFORE INSERT ON `employees` FOR EACH ROW set new.salary = (new.hourly_pay * 2080)

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
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_hourly_pay_update` BEFORE UPDATE ON `employees` FOR EACH ROW set new.salary = (new.hourly_pay * 2080)

-- update employees
-- set salary = hourly_pay * 2080

-- alter table employees
-- add column salary decimal(10,2) after hourly_pay
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int NOT NULL,
  `expense_name` varchar(50) DEFAULT NULL,
  `expense_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expense_id`, `expense_name`, `expense_total`) VALUES
(1, 'salaries', 356200.00),
(2, 'supplies', 0.00),
(3, 'taxes', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `price` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES
(100, 'hamburger', 3.99),
(101, 'fries', 1.89),
(102, 'soda', 1.00),
(103, 'ice cream', 1.49),
(104, 'cookies', 0.00),
(104, 'straw', 0.00),
(105, 'napkin', 0.00),
(106, 'fork', 0.00),
(107, 'spoon', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `rabdin`
--

CREATE TABLE `rabdin` (
  `id` int DEFAULT NULL,
  `string1` varchar(50) DEFAULT NULL,
  `string2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rabdin`
--

INSERT INTO `rabdin` (`id`, `string1`, `string2`) VALUES
(1, 'sjn', 'oismdofim'),
(2, 'sjn', 'oismdofim'),
(3, 'sjn', 'oismdofim'),
(4, 'sjn', 'oismdofim');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL,
  `amount` decimal(5,2) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `amount`, `customer_id`, `order_date`) VALUES
(1000, 4.22, 1, '2023-01-01'),
(1001, 22.36, 3, '2023-01-01'),
(1002, 5.66, 2, '2023-01-02'),
(1003, 6.66, 1, '2023-01-02'),
(1004, 1.00, NULL, '2023-01-03'),
(1005, 26.24, 4, '2023-01-03'),
(1006, 30.37, NULL, '2023-01-04'),
(1007, 10.28, NULL, '2023-01-04');

-- --------------------------------------------------------

--
-- Structure for view `attendance`
--
DROP TABLE IF EXISTS `attendance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user1`@`%` SQL SECURITY DEFINER VIEW `attendance`  AS SELECT `employees`.`firstname` AS `firstname`, `employees`.`lastname` AS `lastname` FROM `employees` ;

-- --------------------------------------------------------

--
-- Structure for view `customer_email`
--
DROP TABLE IF EXISTS `customer_email`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user1`@`%` SQL SECURITY DEFINER VIEW `customer_email`  AS SELECT `customers`.`email` AS `email` FROM `customers` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fullname_idx` (`last_name`,`first_name`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD UNIQUE KEY `product_name` (`product_name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `fk_customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

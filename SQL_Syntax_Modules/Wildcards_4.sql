-- % = any character, _ = one character

USE basic_db;

-- Find any client who's name contains a certain string
SELECT *
FROM client
WHERE client_name LIKE "%LLC";

-- Find any branch suppliers who are in the Label business
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE "%Labels%";

SELECT *
FROM employee
WHERE birth_day LIKE "____-10%";

-- -------------------------------------------------------------------------------
USE sql_store;

SELECT *
FROM customers
WHERE first_name LIKE "A%";

SELECT *
FROM customers
WHERE phone NOT LIKE "9%";

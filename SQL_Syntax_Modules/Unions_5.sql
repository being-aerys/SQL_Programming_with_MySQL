-- UNION - Literally, put UNION keyword in between two SQL queries.

-- --------------------------------------------------------------------------------
-- Using sql_store database
-- --------------------------------------------------------------------------------
SELECT order_id, "Active" AS Status
FROM orders
WHERE order_date = "2020-01-01"
UNION
SELECT order_id, "Archived" AS Status
FROM orders
WHERE order_date < "2020-01-01";

-- --------------------------------------------------------------------------------
-- Using basic_db database
-- --------------------------------------------------------------------------------
USE basic_db;

-- Find a list of employees and branch names
SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch;
-- Notice that both the SELECT statements should select the same no of columns and the same data type
-- for the corresponding columns.

-- Find a list of all clients and branch suppliers
SELECT client_name, branch_id
FROM client
UNION
SELECT supplier_name, branch_id
FROM branch_supplier;

-- Find a list of all money spend or earned by the company.
SELECT SALARY
from employee
UNION
SELECT total_sales
FROM works_with;

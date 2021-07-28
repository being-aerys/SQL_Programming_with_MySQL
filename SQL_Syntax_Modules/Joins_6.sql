
-- --------------------------------------------------------------------------------
-- Using basic_db database
-- --------------------------------------------------------------------------------

USE basic_db;

-- INNER JOIN : Include only the overlapping entries from both the tables
-- Find all the branches and the names of their managers.
SELECT employee.first_name, employee.emp_id, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- LEFT JOIN/ LEFT OUTER JOIN
-- Include the overlapping entries from both the tables as well as all the entries from the left table.
-- Find all the branches and the names of their managers.
SELECT employee.first_name, employee.emp_id, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- RIGHT JOIN/ RIGHT OUTER JOIN
-- Include the overlapping entries from both the tables as well as all the entries from the right table.
-- Find all the branches and the names of their managers.
SELECT employee.first_name, employee.emp_id, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- FULL OUTER JOIN : A combination of both left and right joins.
-- Not directly possible in MySQL, Can use left join + union + outer join to achieve the same

-- --------------------------------------------------------------------------------
-- Using sql_store database
-- --------------------------------------------------------------------------------
USE sql_store;

-- Inner join
SELECT orders.order_id, customers.first_name, customers.customer_id
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id;

-- --------------------------------------------------------------------------------
-- JOINING ACROSS MULTIPLE DATABASES
-- --------------------------------------------------------------------------------
SELECT *
FROM order_items -- Can directly refer to this table as we are using the sql_store database using the USE keyword.
JOIN sql_inventory.products -- Need to point out in which database this table lies.
ON order_items.product_id = sql_inventory.products.product_id;

-- --------------------------------------------------------------------------------
-- SELF JOIN (Requires alias for the tables)
-- --------------------------------------------------------------------------------
USE sql_hr;

SELECT e1.employee_id, e1.first_name as Employee, e2.first_name AS Manager
FROM employees e1 -- e1 and e2 are aliases
JOIN employees e2
ON e1.reports_to = e2.employee_id;

-- --------------------------------------------------------------------------------
-- JOINING MULTIPLE TABLES
-- --------------------------------------------------------------------------------
USE sql_store;

SELECT o.order_id, o.order_date, c.first_name, os.name AS order_status
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_statuses os
ON o.status = os.order_status_id;

-- --------------------------------------------------------------------------------
-- COMPUND (INNER) JOIN STATEMENT TO HANDLE JOINS WITH COMPOSITE PRIMARY KEYS
-- --------------------------------------------------------------------------------
SELECT *
FROM order_items i
JOIN order_item_notes n
ON i.order_id = n.order_id
AND i.product_id = n.product_id;

-- --------------------------------------------------------------------------------
-- OUTER JOINS
-- 3 types: LEFT (OUTER) JOIN, RIGHT (OUTER) JOIN, FULL OUTER JOIN
-- --------------------------------------------------------------------------------
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- --------------------------------------------------------------------------------
-- OUTER JOINS BETWEEN MULTIPLE TABLES
-- --------------------------------------------------------------------------------
SELECT
c.customer_id, c.first_name, o.order_id, sh.name AS Shipper
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

-- --------------------------------------------------------------------------------
-- SELF OUTER JOINS
-- --------------------------------------------------------------------------------
USE sql_hr;

SELECT e.employee_id, e.first_name, m.first_name as Manager
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id

-- --------------------------------------------------------------------------------
-- "USING" clause to replace ON
-- --------------------------------------------------------------------------------
USE sql_store;

SELECT o.order_id, c.first_name
FROM orders o
JOIN customers c
-- ON o.customer_id = c.customer_id;
USING (customer_id); -- works only if the column name is the same in both the tables.

-- --------------------------------------------------------------------------------
-- "USING" clause for composite primary keys
-- --------------------------------------------------------------------------------
SELECT *
FROM order_items oi
JOIN order_item_notes oin
-- ON or.order_id = oin.order_id AND oi.product_id = oin.product_id
USING (order_id, product_id);

-- --------------------------------------------------------------------------------
-- CROSS JOIN -- Join every record from the first table with every record from the second table
-- Typically want when we want a cartesian product type matching of the tables.
-- This demo example does not make much sense in practice.
-- --------------------------------------------------------------------------------
SELECT c.first_name AS customer, p.name AS product
FROM customers c
CROSS JOIN products p;

-- AGGREGATION
-- An aggregation function groups the values of multiple rows togerther to form a single summary value.

USE basic_db;

-- Count
SELECT COUNT(emp_id)
FROM employee;

SELECT COUNT(super_id)
FROM employee
WHERE sex = "F" AND birth_day > "1971-01-01";

-- AVERAGE
SELECT AVG(salary)
FROM employee
WHERE sex = "M";

-- SUM
SELECT SUM(salary)
FROM employee
WHERE sex = "M";

SELECT *
FROM employee;

-- ----------------------------------------------------------------------
-- AGGREGATION after GROUPING
-- Typically, GROUP BY is used in conjunction with aggregation functions like MAX()
-- to find the max in each group.
-- Find how many males and females there are in the employee table
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

-- Find the total sales of each salesperson
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;

USE showroom;
SELECT COUNT(name), company
FROM cars
GROUP BY company;

-- Using WHERE clause to compare multiple columns at once
SELECT A1.player_id, A1.device_id
FROM Activity A1
WHERE (A1.player_id, A1.event_date) IN (SELECT A2.player_id, MIN(A2.event_date)
                                        FROM Activity A2
                                        GROUP BY A2.player_id);

-- ---------------------------------------------------------------------------
-- HAVING clause : Similar to WHERE but allows us to use COUNT() and other functions at the end instead of together with
-- SELECT.
-- ---------------------------------------------------------------------------
SELECT C.class
FROM courses C
HAVING COUNT(C.class) >= 5;
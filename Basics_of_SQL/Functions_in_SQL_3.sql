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

-- AGGREGATION/ GROUPING
-- Find how many males and females there are in the employee table
SELECT COUNT(sex), sex
FROM employee
GROUP sex;

-- Find the total sales of each salesperson
SELECT SUM(total_sales), emp_id
FROM works_with
group by emp_id;

-- Nested Query is a query that has multiple SELECT statements.

-- Find names of all the employees who have sold at least one produce worth more than 30K.

-- First lets see the query that could be used to find the employee ids who sold as required.
SELECT works_with.emp_id
FROM works_with
WHERE works_with.total_sales > 30000;

-- However, next, we will use this query inside another query to get the desired result.
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee. emp_id IN (
	SELECT works_with.emp_id
	FROM works_with
	WHERE works_with.total_sales > 30000
);


-- Find all clients who are handled by the branch managed by Michael Scott.
SELECT client.client_name
FROM client
WHERE client.branch_id = (
	SELECT branch.branch_id
	FROM branch
	WHERE branch.mgr_id = 102
    LIMIT 1 -- The manager could be managing multiple branches, so limiting here for now.
);


-- --------------------------------------------------------------------------------------
-- Use sql_store database
-- --------------------------------------------------------------------------------------


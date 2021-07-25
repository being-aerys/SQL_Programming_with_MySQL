-- INNER JOIN : Include only the overlapping entries from both the tables
-- Find all the branches and the names of their managers.
SELECT employee.first_name, employee.emp_id, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- LEFT JOIN : Include the overlapping entries from both the tables as well as all the entries from the left table.
-- Find all the branches and the names of their managers.
SELECT employee.first_name, employee.emp_id, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- RIGHT JOIN : Include the overlapping entries from both the tables as well as all the entries from the right table.
-- Find all the branches and the names of their managers.
SELECT employee.first_name, employee.emp_id, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- OUTER JOIN : A combination of both left and right joins. Not directly possible in MySQL, Can use
-- left join + union + outer join to achieve the same
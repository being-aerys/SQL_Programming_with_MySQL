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
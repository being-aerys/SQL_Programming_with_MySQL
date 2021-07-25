-- % = any character, _ = one character

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
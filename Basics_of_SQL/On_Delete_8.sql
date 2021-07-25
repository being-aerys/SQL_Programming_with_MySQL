-- Suppose we want to delete an employee from the EMPLOYEE table.
-- Say that employee is a manager of a branch.
-- BRANCH table has an entry for a branch with its mgr_id foreign key pointed to this employee's entry in the EMPLOYEE table.
-- What happens to the mgr_id value for the entry in the BRANCH table if we delete the employee from the EMPLOYEE table?

-- Two ways to deal with this.
-- 1) ON DELETE SET NULL
		-- If the emp_id in the EMPLOYEE table gets deleted, set the mgr_id in the BRANCH table to NULL.


CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

DELETE FROM employee
WHERE emp_id = 102;

SELECT *
FROM branch;	-- mgr_id will be NULL for the particular branch.



-- 2) ON DELETE CASCADE
		-- If the foreign key gets deleted, delete this entry from the current table altogether.
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

DELETE FROM branch
WHERE branch_id = 2;

SELECT *
FROM branch_supplier

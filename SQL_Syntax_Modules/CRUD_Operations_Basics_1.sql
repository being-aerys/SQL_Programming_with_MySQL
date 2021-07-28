-- ------------------------------------------------------------------------------
-- OPERATIONS IN basic_db DATABASE
-- ------------------------------------------------------------------------------

/*Create a table  in SQL*/
DROP DATABASE IF EXISTS basic_db;
CREATE DATABASE basic_db;
USE basic_db;

CREATE TABLE student (
student_id INT PRIMARY KEY,
fullname VARCHAR(100),
major VARCHAR(30)
);

/*Describe a table  in SQL*/
DESCRIBE student;

/*Drop a table  in SQL*/
DROP table student;

/*Recreate the same table but with some new constraints on different columns.*/
CREATE TABLE student (
student_id INT PRIMARY KEY AUTO_INCREMENT,					#A primary key is just a column that should be NOT NULL and UNIQUE.
fullname VARCHAR(100) NOT NULL,
major VARCHAR(30) UNIQUE
);

/*Add a new coilumn to the table*/
ALTER TABLE student ADD gpa DECIMAL (3,2);  #adding a new column to the database table, here the gpa value for each entry should be unique
#here 3 is the number of digits a gpa can have and 2 is the number of digits after the decimal value.


#View the table using the SELECT keyword.
SELECT * from student;

#Insert a new record into the table (when all column values are available)
INSERT INTO student
VALUES(1,'August Adhikari','Computer Science', 3.9);

#View the updated table using the SELECT keyword.
SELECT *
FROM student;

#Insert a record where a certain column value is not available.
INSERT INTO student(student_id, fullname, major)
VALUES (2, "Amit Bhattarai", "Information Technology"); #This causes the gpa value for Amit to be Null.

#View the updated table using the SELECT keyword. Notice the null gpa value for Amit.
SELECT *
FROM student;

INSERT INTO student(student_id, fullname, major, gpa)
VALUES (3, "Anjana Shrestha", "Computer Engineering", 4.0);

INSERT INTO student(fullname, major, gpa)
VALUES ("Jupiter Tamrakar", "Knowledge Engineering", 4.0);

INSERT INTO student(fullname, major, gpa)
VALUES ("Vishnu Manandhar", "Biology", 4.0);

#Change the value of one of the fields.
 UPDATE student
 SET major = "Civil Engineering"
 WHERE major = "Biology";
 
 #Disable soft update mode
 SET SQL_SAFE_UPDATES = 0;

#Using multiple conditions in the WHERE clause
 UPDATE student
 SET major = "Software Engineering"
 WHERE gpa = 4.0 AND major = "Civil Engineering";

#Delete a specific record
DELETE FROM student
WHERE student_id = 6;

#Different variations of SELECT

#Select a certain column
SELECT fullname
FROM student;

SELECT fullname, gpa
FROM student;

SELECT student.fullname, student.major
FROM student; #comes handy when there are multiple tables

SELECT student.fullname
FROM student
ORDER BY gpa; #numerical order, in ascending order by default

SELECT student.fullname, student.gpa
FROM student
ORDER BY student.fullname DESC; #using alphabetical order of the names, descending order, use ASC for ascending

SELECT *
FROM student
ORDER BY student.gpa, student.fullname; #first order by student gpa, if the gpa conflicts, order by fullname

#Limit the number of results returned using the LIMIT keyword
SELECT *
FROM student
LIMIT 2;

#Different operators that can be used in SQL are <, >, <=, >=, =, <>, AND, OR
SELECT *
FROM student
WHERE student_id <> 1; #returns all the records where student_id is not 1

#IN keyword can be used to specify multiple values to compare with
SELECT *
FROM student
WHERE gpa IN (4, 3.9);

SELECT *
FROM student
WHERE gpa IN (4, 3.9) AND student_id >2;

-- ------------------------------------------------------------------------------
-- OPERATIONS IN SQL STORE DATABASE
-- ------------------------------------------------------------------------------
-- ------------------------------------
-- SELECT STATEMENT--------------------
-- ------------------------------------

USE sql_store;

SELECT products.product_id, products.unit_price, unit_price * 1.1 AS new_price
FROM products;

SELECT *
FROM orders
WHERE order_date >= "2018-01-01";

SELECT *
FROM customers
WHERE birth_date >= "1990-01-01" AND points > 1000;

-- From the order_items table, get the items for order number 6 where the total price is greater than 30.
SELECT *
FROM order_items
WHERE order_id = 6 AND quantity * unit_price > 30;

SELECT *
FROM customers
WHERE state IN ("VA","CA");

-- Return products with quantity in stock between 50 and 60.
SELECT *
FROM products
WHERE quantity_in_stock BETWEEN 50 AND 60;

SELECT *
FROM customers
WHERE phone is NULL;

SELECT *
FROM customers
LIMIT 6,3; -- skip the first 6 records and then fetch the next 3.

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

-- ------------------------------------
-- INSERT STATEMENT--------------------
-- ------------------------------------
INSERT INTO customers
VALUES (DEFAULT, "Sulav", "Kafley", NULL, NULL, "Random Address", "Corvallis", "OR", DEFAULT);

-- INSERT multiple rows
INSERT INTO shippers (name)
VALUES("Shipper1"),("Shipper2"),("Shipper3");

-- INSERTING HEIRARCHIAL ROWS --> Insert into multiple tables using LAST_INSERT_ID()
INSERT INTO orders(customer_id, order_date, status)
VALUES (1,"2019-01-02",1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1,1,2.99);

-- ------------------------------------
-- CREATE A COPY OF A TABLE------------
-- ------------------------------------

-- To copy all the records into the new table.
CREATE TABLE orders_archive AS
SELECT * FROM orders;

-- To copy only a subset of records.
TRUNCATE sql_store.orders_archive; -- deletes all the records that we just copied.

INSERT INTO orders_archive
SELECT * FROM orders
WHERE order_date<"2019-01-01";

-- ------------------------------------
-- UPDATE STATEMENT--------------------
-- ------------------------------------
USE sql_invoicing;

-- Update a single row.
UPDATE invoices
SET payment_total = 10, payment_date = "2019-03-01"
WHERE invoice_id = 1;

-- Update multiple rows.
UPDATE invoices
SET payment_total = 10, payment_date = "2019-03-01"
WHERE invoice_id = (3,5); -- updates for rows with invoice ids 3 and 5.

-- Subqueries in UPDATE statementsUPDATE invoices
UPDATE invoices
SET payment_total = 10, payment_date = "2019-03-01"
WHERE invoice_id = 
					(SELECT client_id
                    FROM clients
                    WHERE state in ("CA", "MA"));
                    
-- ------------------------------------
-- DELETE STATEMENT--------------------
-- ------------------------------------
DELETE FROM invoices
WHERE invoice_id = 1;

DELETE FROM invoices
WHERE client_id = (SELECT client_id
                    FROM clients
                    WHERE name = "Myworks"
                    );




/*Create a table  in SQL*/
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
INSERT INTO student VALUES(1,'August Adhikari','Computer Science', 3.9);

#View the updated table using the SELECT keyword.
SELECT * from student;

#Insert a record where a certain column value is not available.
INSERT INTO student(student_id, fullname, major) VALUES (2, "Amit Bhattarai", "Information Technology"); #This causes the gpa value for Amit to be Null.

#View the updated table using the SELECT keyword. Notice the null gpa value for Amit.
SELECT * from student;

INSERT INTO student(student_id, fullname, major, gpa) VALUES (3, "Anjana Shrestha", "Computer Engineering", 4.0);

INSERT INTO student(fullname, major, gpa) VALUES ("Jupiter Tamrakar", "Knowledge Engineering", 4.0);

INSERT INTO student(fullname, major, gpa) VALUES ("Vishnu Manadhar", "Biology", 4.0);

#Change the value of one of the fields.
 UPDATE student SET major = "Civil Engineering" WHERE major = "Biology";
 
 #Disable soft update mode
 SET SQL_SAFE_UPDATES = 0;

#Using multiple conditions in the WHERE clause
 UPDATE student SET major = "Software Engineering" WHERE gpa = 4.0 AND major = "Civil Engineering";

#Delete a specific record
DELETE FROM student WHERE student_id = 6;

#Different variations of SELECT

#Select a certain column
SELECT fullname from student;

SELECT fullname, gpa from student;

SELECT student.fullname, student.major from student; #comes handy when there are multiple tables

SELECT student.fullname FROM student ORDER BY gpa; #numerical order, in ascending order by default

SELECT student.fullname, student.gpa FROM student ORDER BY student.fullname DESC; #using alphabetical order of the names, descending order, use ASC for ascending

SELECT * FROM student ORDER BY student.gpa, student.fullname; #first order by student gpa, if the gpa conflicts, order by fullname

#Limit the number of results returned using the LIMIT keyword
SELECT * FROM student LIMIT 2;

#Different operators that can be used in SQL are <, >, <=, >=, =, <>, AND, OR
SELECT * FROM student WHERE student_id <> 1; #returns all the records where student_id is not 1

#IN keyword can be used to specify multiple values to compare with
SELECT * FROM student WHERE gpa IN (4, 3.9);

SELECT * FROM student WHERE gpa IN (4, 3.9) AND student_id >2;





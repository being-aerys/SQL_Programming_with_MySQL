
/*Create a table  in SQL*/
CREATE TABLE student (
student_id INT PRIMARY KEY,
fullname VARCHAR(100) NOT NULL,
major VARCHAR(30)
);

/*Describe a table  in SQL*/
DESCRIBE student;

/*Drop a table  in SQL*/
DROP table student;

/*Recreate the same table.*/
CREATE TABLE student (
student_id INT PRIMARY KEY,					#A primary key is by default NOT NULL and UNIQUE.
fullname VARCHAR(100) NOT NULL,
major VARCHAR(30) UNIQUE
);

/*Add a new coilumn to the table*/
ALTER TABLE student ADD gpa DECIMAL (3,2);  #adding a new column to the database table, here the gpa value for each entry should be unique
#here 3 is the number of digits a gpa can have and 2 is the number of digits after the decimal value.


#View the table using the SELECT keyword.
SELECT * from student;

#Insert new records into the table
INSERT INTO student VALUES(1,'August','Computer Science', 3.9);

#View the updated table using the SELECT keyword.
SELECT * from student;

#Insert a record where a certain column value is not available.
INSERT INTO student(student_id, fullname, major) VALUES (2, "Amit", "Information Technology"); #This causes the gpa value for Amit to be Null.

#View the updated table using the SELECT keyword. Notice the null gpa value for Amit.
SELECT * from student;

INSERT INTO student(student_id, fullname, major, gpa) VALUES (3, "Anjana", "Computer Engineering", 4.0); 



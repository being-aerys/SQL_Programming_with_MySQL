

# taken from multiple sources including codingsight.com, beardeddev
-- -----------------------------------------------------
DROP DATABASE IF EXISTS ShowRoom;
CREATE Database ShowRoom;
USE ShowRoom;

CREATE TABLE Cars
(
id INT,
name VARCHAR(50) NOT NULL,
company VARCHAR(50) NOT NULL,
cost INT NOT NULL
);


USE ShowRoom;
INSERT INTO Cars
VALUES
(1, 'Corrolla', 'Toyota', 1800),
(2, 'City', 'Honda', 1500),
(3, 'C200', 'Mercedez', 2000),
(4, 'Vitz', 'Toyota', 1300),
(5, 'Baleno', 'Suzuki', 1500),
(6, 'C500', 'Mercedez', 5000),
(7, 'C800', 'BMW', 8000),
(8, 'Mustang', 'Ford', 5000),
(9, '208', 'Peugeot', 5400),
(10, 'Prius', 'Toyota', 3200),
(11, 'Atlas', 'Volkswagen', 5000),
(12, 'C110', 'Bugatti', 8000),
(13, 'Landcruiser', 'Toyota', 3000),
(14, 'Civic', 'Honda', 1800),
(15, 'Accord', 'Honda', 2000),
(16, 'M111', 'Bugatti', 2000),
(17, 'C600', 'BMW', 1000);



USE Showroom;

SELECT *
FROM Cars;

-- ---------------------------------------------------------------------------------------------------
-- Basic Grouping using GROUP BY clause based on the company name
-- GROUP BY returns one row for an entire group.
-- ---------------------------------------------------------------------------------------------------
SELECT C.company, SUM(C.cost) AS total_company_cost
FROM Cars C
GROUP BY C.company
ORDER BY C.company;

-- ---------------------------------------------------------------------------------------------------
-- OVER(PARTITION BY XXX) function
-- PARTITION BY creates a new column : calculates an aggregate function for each partition (e.g., gender) and
-- uses these values as a new column.
-- ---------------------------------------------------------------------------------------------------
SELECT C.name, C.company, COUNT(C.company) OVER(PARTITION BY C.company) AS Total_Cars_of_this_Company
FROM Cars C;

SELECT C.name, C.company, SUM(C.cost) OVER(PARTITION BY C.company ORDER BY C.company) AS Cumulative_cost_so_far
FROM Cars C;
-- ---------------------------------------------------------------------------------------------------
-- ROW_NUMBER() function creates a new row that assigns a sequential number to each row in the result set.
-- ---------------------------------------------------------------------------------------------------

-- First, lets see what the table looks like originally.
SELECT name, company
FROM cars;

-- Individual Ranking for the entries as it is originally.
SELECT name, company, ROW_NUMBER() OVER () custom_rank
FROM cars;

-- Individual Ranking using some ascending/ descending order of a particular column
SELECT name, company, ROW_NUMBER() OVER (ORDER BY company DESC) AS Custom_Rank
FROM cars;

-- Individual Ranking but Ranking within each group by partitioning data into multiple groups based in values of a particular column
-- Ranking resets for each new partition
SELECT name, company, ROW_NUMBER() OVER (PARTITION BY company ORDER BY company DESC) AS custom_rank
FROM cars;


-- ---------------------------------------------------------------------------------------------------
-- RANK() function : If n entries share the same value in the ORDER BY column, they are given the same rank
-- and the next entry with a different value is ranked by skipping n ranks.
-- ---------------------------------------------------------------------------------------------------
SELECT name, company, RANK() OVER(ORDER BY company DESC) AS Custom_Rank
FROM cars;

-- PARTITION BY used in conjunction with ORDER BY.
SELECT name, company, power, RANK() OVER(PARTITION BY company ORDER BY power DESC) AS Custom_Rank
FROM cars;


-- ---------------------------------------------------------------------------------------------------
-- DENSE_RANK() function works similar to RANK() but does not skip any rank.
-- ---------------------------------------------------------------------------------------------------
SELECT name, company, power, DENSE_RANK() OVER(ORDER BY power DESC) AS PowerRank
FROM cars;

SELECT name, company, power, DENSE_RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank
FROM cars;


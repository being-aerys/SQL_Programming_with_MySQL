USE sql_store;

-- REGULAR EXPRESSSIONS can be used for pattern matching just like wildcards but are more powerful as seen below.

-- Can use % for the following pattern matching.
SELECT *
FROM customers
WHERE last_name LIKE "%field%";

-- REGEXP can be used to rewrite the same query.
SELECT *
FROM customers
WHERE last_name REGEXP "field"; -- checks for any occurence of "field" in the value

-- Can use ^ to denote the start of the value.
SELECT *
FROM customers
WHERE last_name REGEXP "^R"; -- requires "field" to be the start of the value.

-- Can use a $ to indicate the end of the value.
SELECT *
FROM customers
WHERE last_name REGEXP "t$" -- requires "field" to be the start of the value.

-- Can use a | to find multiple patterns at once.
SELECT *
FROM customers
WHERE last_name REGEXP "mac|field|rose" ;

SELECT *
FROM customers
WHERE last_name REGEXP "mac$|field$|^rose" ;

-- Matching any of a multiple of values

SELECT *
FROM customers
WHERE last_name REGEXP "[gar]e"; -- matches any "ge" or "ae" or "re"

SELECT *
FROM customers
WHERE last_name REGEXP "e[gty]"; -- matches any "eg" or "et" or "ey"

-- Can even supply a range of character.
SELECT *
FROM customers
WHERE last_name REGEXP "e[a-f]";

-- Get the customers with the last names that staer with MY or end with SE
SELECT *
FROM customers
WHERE last_name REGEXP "^MY|SE$";

SELECT *
FROM customers
WHERE last_name REGEXP "B[RU]";
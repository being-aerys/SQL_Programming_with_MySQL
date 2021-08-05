-- FROM https://stackoverflow.com/questions/9253244/sql-having-vs-where/9253267


/*
 The WHERE clause applies the condition to individual rows before the rows are summarized into groups by the GROUP BY
 clause. However, the HAVING clause applies the condition to the groups after the rows are grouped into groups.

 SELECT
	column1,
	column2,
	AGGREGATE_FUNCTION (column3)
FROM
	table1
GROUP BY
	column1,
	column2
HAVING
	group_condition;

 SELECT
    manager_id,
    first_name,
    last_name,
    COUNT(employee_id) direct_reports
FROM
    employees
WHERE
    manager_id IS NOT NULL
GROUP BY manager_id;

 1. WHERE clause fetches the rows on the basis of the condition given.
 2. HAVING clause works on the result set that was achieved after running a query.
 3. WHERE filters rows before aggregation (GROUP BY), whereas HAVING filter groups after aggregations are performed.
 4. WHERE clause can be used with SELECT, INSERT, and UPDATE statements, whereas HAVING can be used only with SELECT.
 5. HAVING clause is used for aggregate functions such as MIN,MAX,COUNT,SUM .But always use GROUP BY clause before
    HAVING clause to minimize the error.
 */




SELECT country, city, sum(total) totalCityOrders
FROM INTERNATIONAL_ORDERS with (nolock)
WHERE companyId = 884501253109
GROUP BY country, city
HAVING country = 'MX'
ORDER BY sum(total) DESC

/*
 This filters the table first by the companyId, then groups it (by country and city) and additionally filters it down
 to just city aggregations of Mexico. The companyId was not needed in the aggregation but we were able to use WHERE to
 filter out just the rows we wanted before using GROUP BY.
 */
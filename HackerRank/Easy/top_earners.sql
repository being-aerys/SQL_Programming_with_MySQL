SELECT CTE.total_earnings, COUNT(CTE.total_earnings)
FROM (SELECT E.months * E.salary AS total_earnings FROM Employee E) AS CTE
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;
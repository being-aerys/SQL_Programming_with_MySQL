SELECT person_name FROM (SELECT *, SUM(Q.weight) OVER(ORDER BY Q.turn) AS cumulative_weight FROM Queue Q) AS Table_New
WHERE cumulative_weight <= 1000
ORDER BY cumulative_weight DESC
    LIMIT 1;
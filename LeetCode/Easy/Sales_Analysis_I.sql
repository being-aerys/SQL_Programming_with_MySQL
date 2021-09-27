WITH Temp_Table AS (SELECT S.seller_id, SUM(S.price) AS total
                    FROM Sales S
                    GROUP BY S.seller_id
                    ORDER BY SUM(S.price) DESC)

SELECT T.seller_id
FROM Temp_Table T
WHERE T.total = (SELECT T2.total
                 FROM Temp_Table T2
    LIMIT 1);
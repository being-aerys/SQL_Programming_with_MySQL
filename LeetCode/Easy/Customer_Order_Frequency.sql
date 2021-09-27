SELECT C.customer_id, C.name
FROM Orders O

         JOIN Customers C USING (customer_id)
         JOIN Product P USING (product_id)

WHERE O.order_date BETWEEN "2020-06-01" AND "2020-07-30"

GROUP BY C.customer_id

HAVING SUM(CASE
               WHEN MONTH(O.order_date) = "06" THEN O.quantity * P.price
           ELSE 0
           END) >= 100

   AND

        SUM(CASE
                WHEN MONTH(O.order_date) = "07" THEN O.quantity * P.price
           ELSE 0
           END) >= 100;
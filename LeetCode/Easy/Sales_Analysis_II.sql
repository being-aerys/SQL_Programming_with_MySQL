WITH SEIGHT AS (SELECT S2.buyer_id FROM Sales S2, Product P1 WHERE S2.product_id = P1.product_id AND P1.product_name = "S8"),
     IPHONE AS (SELECT S3.buyer_id FROM Sales S3, Product P2 WHERE S3.product_id = P2.product_id AND P2.product_name = "iPhone")

SELECT DISTINCT S.buyer_id
FROM SEIGHT S
WHERE S.buyer_id NOT IN (SELECT IPHONE.buyer_id FROM IPHONE);
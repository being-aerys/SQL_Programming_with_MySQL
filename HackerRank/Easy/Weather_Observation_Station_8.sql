SELECT DISTINCT S.CITY
FROM STATION S
WHERE (SELECT LEFT(S.CITY,1) AS LEFT_SUBSTRING) IN ("a","e","i","o","u") AND
    (SELECT RIGHT(S.CITY,1) AS RIGHT_SUBSTRING) IN ("a","e","i","o","u");
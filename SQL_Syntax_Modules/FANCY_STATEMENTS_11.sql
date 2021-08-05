

-- ------------------------------------
-- WHEN-ELSE STATEMENT------------------
-- ------------------------------------
WHEN condition1 THEN result1
WHEN condition2 THEN result2
WHEN conditionN THEN resultN
ELSE result

WHEN Num > 330 THEN 'The num is greater than 330'
WHEN Num = 330 THEN 'The quantity is 330'
ELSE 'The quantity is under 330'

-- ------------------------------------
-- CASE STATEMENT------------------
-- ------------------------------------
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

SELECT Name, City, Country
FROM Consumers C
ORDER BY
    (CASE
         WHEN City IS NULL THEN Country
         ELSE City
        END);
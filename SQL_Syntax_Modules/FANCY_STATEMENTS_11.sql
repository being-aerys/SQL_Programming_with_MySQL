

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
-- CASE STATEMENT--works as if-else ---
-- ------------------------------------
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
-- -----------------------------------------
-- NESTED CASE STATEMENT--works as if-else--
-- -----------------------------------------
-- given three sides, determine if its a triangle or not
-- as well as what type of triangle it is.
SELECT
    CASE
        WHEN (T.A + T.B <= T.C) OR (T.B + T.C <= T.A) OR (T.A + T.C <= T.B) THEN "Not A Triangle"
        ELSE
            CASE
                WHEN (T.A = T.B)  AND (T.B = T.C) THEN "Equilateral"
                WHEN (T.A <> T.B) AND (T.B <> T.C) AND (T.A <> T.C) THEN "Scalene"
                ELSE "Isosceles"
            END
    END
FROM TRIANGLES T;
-- -----------------------------------------

SELECT Name, City, Country
FROM Consumers C
ORDER BY
    (CASE
         WHEN City IS NULL THEN Country
         ELSE City
        END);


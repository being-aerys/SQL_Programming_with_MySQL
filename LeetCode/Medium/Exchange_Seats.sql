SELECT S.id, (CASE
                  WHEN S.id%2 = 1 AND S.id <> (SELECT COUNT(*) FROM seat S3) THEN (SELECT S3.student FROM seat S3 WHERE S3.id = S.id+1)
        WHEN S.id%2 = 0 THEN (SELECT S3.student FROM seat S3 WHERE S3.id = S.id-1)
        WHEN S.id%2 = 1 AND S.id = (SELECT COUNT(*) FROM seat S3) THEN S.student
        END) AS student
FROM seat S;
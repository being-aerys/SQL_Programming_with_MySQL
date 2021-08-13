Table point_2d holds the coordinates (x,y) of some unique points (more than two) in a plane.


Write a query to find the shortest distance between these points rounded to 2 decimals.


| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |


The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:


| shortest |
|----------|
| 1.00     |

SELECT ROUND(SQRT ( MIN( POW((P1.x-P2.x),2)+ POW((P1.y - P2.y),2)) ),2) AS shortest
FROM point_2d P1, point_2d P2
WHERE

    (P1.x <> P2.x AND P1.y <> P2.y) OR (P1.x <> P2.x AND P1.y = P2.y) OR (P1.x = P2.x AND P1.y <> P2.y);
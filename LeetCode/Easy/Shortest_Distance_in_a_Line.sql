Table point holds the x coordinate of some points on x-axis in a plane, which are all integers.


Write a query to find the shortest distance between two points in these points.


| x   |
|-----|
| -1  |
| 0   |
| 2   |


The shortest distance is '1' obviously, which is from point '-1' to '0'. So the output is as below:


| shortest|
|---------|
| 1       |


Note: Every point is unique, which means there is no duplicates in table point.



SELECT MIN(ABS(P1.x - P2.x)) AS shortest
FROM point P1, point P2
WHERE P1.x <> P2.x;
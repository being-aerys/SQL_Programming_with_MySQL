# VVI: NOTICE THAT THE DIFFERENT SELECT STATEMENTS ARE IN () FOR UNION.

 (SELECT S.CITY, LENGTH(S.CITY)
 FROM STATION S
 ORDER BY LENGTH(S.CITY), S.CITY ASC
     LIMIT 1)
 UNION
 (SELECT S2.CITY, LENGTH(S2.CITY)
 FROM STATION S2
 ORDER BY LENGTH(S2.CITY) DESC, S2.CITY ASC
     LIMIT 1);
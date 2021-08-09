-- ---------------------------------------------------------------------------------------------------
-- LENGTH() function returns the length of a string in bytes.
-- ---------------------------------------------------------------------------------------------------
SELECT T.tweet_id
FROM Tweets T
WHERE LENGTH(T.content) > 15;


-- ---------------------------------------------------------------------------------------------------
-- SUBSTRING() function allows us to extract a substring from a string.
-- ---------------------------------------------------------------------------------------------------
SELECT SUBSTRING("DUMMY_STRING", 5, 3) AS Extracted_Substring; -- starts at position 5 and extracts 3 characters.

SELECT LEFT("BUMMY_STRING",3) AS LEFT_SUBSTRING; -- extracts 3 characters from the left of the string.

SELECT RIGHT("BUMMY_STRING",3) AS RIGHT_SUBSTRING; -- extracts 3 characters from the left of the string.
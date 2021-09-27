SELECT U.user_id, U.name, U.mail
FROM Users U
WHERE U.mail REGEXP "^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$"
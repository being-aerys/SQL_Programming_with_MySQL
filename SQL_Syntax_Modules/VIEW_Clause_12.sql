
CREATE VIEW custom_view_name
AS ( whatever you want to return from an SQL query);

-- MySQL stores this result as a table in the database with the same name.
-- Next time you want to access this data, just

SELECT *
FROM custom_view_name;
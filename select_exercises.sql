USE albums_db;
SHOW TABLES;
SELECT * FROM albums;
-- There are 31 rows in the albums table
SELECT count(DISTINCT artist) FROM albums;
-- there are 23 distinct artists
DESCRIBE albums;
-- Primary key is id
SHOW albums;
SELECT * FROM albums;
-- The oldest release date is 1967. The newest is 2011.
SELECT * FROM albums WHERE artist LIKE 'Pink Floyd';

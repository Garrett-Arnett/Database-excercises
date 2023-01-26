USE albums_db;
SHOW TABLES;
SELECT * FROM albums;
-- There are 31 rows in the albums table
SELECT count(DISTINCT artist) FROM albums;
-- there are 23 distinct artists
DESCRIBE albums;
-- Primary key is id
SELECT * FROM albums;
-- The oldest release date is 1967. The newest is 2011.
SELECT * FROM albums WHERE artist LIKE 'Pink Floyd';
-- The albums by Pink Floyd are The Dark Side of the Moon, and The Wall.
SELECT * FROM albums WHERE Name LIKE '%Hearts%';
-- Sgt. Pepper's Lonely Hearts Club Band was released in 1967
SELECT * FROM albums WHERE Name LIKE 'Nevermind';
-- The genrea for the album Nevermind is Grunge, Alternative rock.
SELECT * FROM albums WHERE release_date between 1990 and 1999;
-- There where 11 albumbs released in the 90s.
SELECT * FROM albums WHERE sales < 20.0;
-- THere are 13 albumbs that have less than 20 million sales.
SELECT name FROM albums WHERE genre LIKE 'rock';
SELECT * FROM albums WHERE genre LIKE '%rock';
-- When you search for the genre 'rock'. It will pull just the rock genre. You have to add % before rock (%rock) to search genres in the areas of rock, hard rock, and progressive rock.


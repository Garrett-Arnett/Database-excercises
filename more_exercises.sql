USE sakila;
-- Select all columns from the actor table.
SHOW tables;
SELECT * FROM actor;
-- Select only the last_name column from the actor table.
SELECT last_name FROM actor;
-- Select only the film_id, title, and release_year columns from the film table.
SELECT film_id, title, release_year FROM film;
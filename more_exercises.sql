USE sakila;
-- Select all columns from the actor table.
SHOW tables;
SELECT * FROM actor;
-- Select only the last_name column from the actor table.
SELECT last_name FROM actor;
-- Select only the film_id, title, and release_year columns from the film table.
SELECT film_id, title, release_year FROM film;
-- Select all distinct (different) last names from the actor table.


SELECT distinct last_name from actor;
-- Select all distinct (different) postal codes from the address table.
SELECT distinct postal_code from address;
-- Select all distinct (different) ratings from the film table.
SELECT distinct rating FROM film;
-- Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.



SELECT title, description, rating, length from film WHERE length >= '180';
-- Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
SELECT * FROM payment;
SELECT payment_id, amount, payment_date FROM payment where payment_date >= '2005-05-27%';
-- Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
SELECT payment_id, amount, payment_date FROM payment WHERE payment_date LIKE '2005-05-27%';
-- Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
SELECT * FROM customer where last_name like 'S%' and first_name LIKE '%N';
-- Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
SELECT * FROM customer WHERE active = '1' and last_name like 'M%';
-- Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
DESCRIBE category;
SELECT * FROM category WHERE category_id > 4 AND name LIKE 'C%' or name like 'S%' or name like 'T%';
-- Select all columns minus the password column from the staff table for rows that contain a password.
SELECT * from staff;
SELECT staff_id, first_name, last_name, address_id,picture, email, store_id, active, username, last_update FROM staff WHERE password IS NOT NULL;
-- Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT staff_id, first_name, last_name, address_id,picture, email, store_id, active, username, last_update FROM staff WHERE password IS NULL;


-- Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
SELECT * from address;
SELECT phone, district FROM address WHERE district IN ('California', 'England', 'Taipei', 'West Java');
-- Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)

-- Select all columns from the film table for films rated G, PG-13 or NC-17.
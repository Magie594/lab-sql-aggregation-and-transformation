USE sakila;
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.category_id, COUNT(film_id)
From sakila.category c
Join sakila.film_category f   
On c. category_id = f.category_id
Group by category_id;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT p.staff_id, SUM(amount) AS rung_up
FROM sakila.payment p
JOIN sakila.staff s ON p.staff_id = s.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY p.staff_id;

-- Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(film_id)
From film_actor f 
Join actor a On f.actor_id = a.actor_id
Group by f.actor_id;

-- Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, COUNT(rental_id)
From payment p
Join customer c On p.customer_id = c.customer_id
group by p.customer_id;

-- Display the first and last names, as well as the address, of each staff member
SELECT s.first_name, s.last_name, s.address_id
From staff s
INNER JOIN address a On s.address_id = a.address_id
order by s.address_id;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name
SELECT c.last_name, c.first_name, SUM(amount) AS total_paid
from payment p
JOIN customer c On p.customer_id = c.customer_id
Group by c.last_name, c.first_name
Order by c.last_name asc;

-- List each film and the number of actors who are listed for that film.
SELECT f.film_id, COUNT(a.actor_id) as number_actors
From film_actor f
JOIN actor a on f.actor_id = a.actor_id
group by f.film_id;

-- List the titles of films per category.
SELECT f.title, Count(category_id) as category
From film f
Join film_category fc on f.film_id = fc.film_id
group by f.title;






USE SAKILA;
-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT *
FROM FILM;
SELECT length
From film;
SELECT max(length) as 'Max_duration', 'Min_duration'
from film;

-- 1.2 Express the average movie duration in hours and minutes. Don't use decimals. Hint: look for floor and round functions.

SELECT AVG(length) 
from film;
SELECT round(AVG(length)) from film;
-- 2.1 Calculate the number of days that the company has been operating. Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) as DATEDIFFERENCE FROM rental;

-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT *, date_format(rental_date, '%M') AS 'month', date_format(rental_date, '%W') AS 'weekday'from rental limit 20;

-- 2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week. Hint: use a conditional expression.
SELECT *, date_format(rental_date, '%W'),
CASE 
WHEN date_format(rental_date, '%W')  IN ('Saturday','Sunday') THEN 'Weekend'
Else 'Workday'
End as 'Day_Type'
From rental;

-- 3. We need to ensure that our customers can easily access information about our movie collection. To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results by the film title in ascending order. Please note that even if there are currently no null values in the rental duration column, the query should still be written to handle such cases in the future.
Select title, ifnull(rental_duration,'Not Available') as rental_duration 
from film 
order by title asc;

-- 4 As a marketing team for a movie rental company, we need to create a personalized email campaign for our customers. To achieve this, we want to retrieve the concatenated first and last names of our customers, along with the first 3 characters of their email address, so that we can address them by their first name and use their email address to send personalized recommendations. The results should be ordered by last name in ascending order to make it easier for us to use the data.
SELECT CONCAT(first_name,last_name ), (left (email,3))
from customer
order by last_name asc;




-- Music Store Data Analysis Queries

--------------------------------------------------------------------------------
-- LEVEL 1: EASY QUESTIONS
--------------------------------------------------------------------------------

-- Q1: Who is the senior-most employee based on job title / hire date?
SELECT 
    employee_id,
    first_name,
    last_name,
    title,
    hire_date
FROM employee
ORDER BY hire_date ASC 
LIMIT 1;


-- Q2: Which countries have the most invoices?
SELECT 
    billing_country,
    COUNT(invoice_id) AS invoice_count
FROM invoice
GROUP BY billing_country
ORDER BY invoice_count DESC 
LIMIT 1;


-- Q3: What are the top 3 values of total invoice amount?
SELECT 
    total AS total_invoice
FROM invoice
ORDER BY total DESC 
LIMIT 3;


-- Q4: Which city has the highest sum of invoice totals (best city for a promotional festival)?
SELECT 
    billing_city,
    SUM(total) AS invoice_total
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC 
LIMIT 1;


-- Q5: Who is the best customer (the customer who has spent the most money)?
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC 
LIMIT 1;


--------------------------------------------------------------------------------
-- LEVEL 2: MODERATE QUESTIONS
--------------------------------------------------------------------------------

-- Q1: Return email, first name, last name, & Genre of all Rock Music listeners (ordered by email).
SELECT DISTINCT 
    c.email,
    c.first_name,
    c.last_name,
    g.name AS genre
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email ASC;


-- Q2: Return top 10 Rock artists based on total track count.
SELECT 
    ar.artist_id,
    ar.name AS artist_name,
    COUNT(t.track_id) AS total_track_count
FROM artist ar
JOIN album a ON ar.artist_id = a.artist_id
JOIN track t ON a.album_id = t.album_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY ar.artist_id, ar.name
ORDER BY total_track_count DESC
LIMIT 10;


-- Q3: Return all track names longer than average track length (ordered descending).
SELECT 
    name,
    milliseconds AS song_length
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds)
    FROM track
)
ORDER BY milliseconds DESC;


--------------------------------------------------------------------------------
-- LEVEL 3: ADVANCED QUESTIONS
--------------------------------------------------------------------------------

-- Q1: Find total amount spent by each customer on each artist.
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    ar.name AS artist_name,
    SUM(il.unit_price * il.quantity) AS total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN album al ON t.album_id = al.album_id
JOIN artist ar ON al.artist_id = ar.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, ar.artist_id, ar.name
ORDER BY total_spent DESC;


-- Q2: Find the most popular music genre for each country based on purchases (with ties handling).
WITH CountryGenrePurchases AS (
    SELECT 
        c.country AS country,
        g.name AS genre_name,
        g.genre_id AS genre_id,
        COUNT(il.invoice_line_id) AS total_purchases,
        DENSE_RANK() OVER (
            PARTITION BY c.country 
            ORDER BY COUNT(il.invoice_line_id) DESC
        ) AS rank_num
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    GROUP BY c.country, g.name, g.genre_id
)
SELECT 
    country,
    genre_name,
    total_purchases
FROM CountryGenrePurchases
WHERE rank_num = 1
ORDER BY country ASC;


-- Q3: Determine the top-spending customer for each country (with ties handling).
WITH CustomerSpendPerCountry AS (
    SELECT 
        c.country AS country,
        c.customer_id AS customer_id,
        c.first_name AS first_name,
        c.last_name AS last_name,
        SUM(i.total) AS total_spent,
        DENSE_RANK() OVER (
            PARTITION BY c.country 
            ORDER BY SUM(i.total) DESC
        ) AS rank_num
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.country, c.customer_id, c.first_name, c.last_name
)
SELECT 
    country,
    customer_id,
    first_name,
    last_name,
    total_spent
FROM CustomerSpendPerCountry
WHERE rank_num = 1
ORDER BY country ASC;
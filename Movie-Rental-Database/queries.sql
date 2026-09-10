-- Movie Rental Database Queries

-- Most rented movies
SELECT m.title, COUNT(*) AS rental_count
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.title
ORDER BY rental_count DESC;

-- Customer rental history
SELECT c.customer_name, m.title, r.rental_date, r.return_date
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN movies m ON r.movie_id = m.movie_id
ORDER BY r.rental_date DESC;

-- Currently rented movies
SELECT c.customer_name, m.title, r.rental_date
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE r.return_date IS NULL;

-- Revenue by genre
SELECT m.genre,
       SUM(m.rental_price) AS rental_revenue
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.genre
ORDER BY rental_revenue DESC;

-- Customer ranking
SELECT c.customer_name,
       COUNT(r.rental_id) AS rentals,
       DENSE_RANK() OVER (ORDER BY COUNT(r.rental_id) DESC) AS customer_rank
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id
GROUP BY c.customer_name;

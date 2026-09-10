INSERT INTO customers (customer_id, customer_name, email) VALUES
(1, 'Aarav', 'aarav@example.com'),
(2, 'Priya', 'priya@example.com'),
(3, 'Rahul', 'rahul@example.com'),
(4, 'Emma', 'emma@example.com');

INSERT INTO movies (movie_id, title, genre, rental_rate) VALUES
(101, 'Inception', 'Sci-Fi', 4.99),
(102, 'The Dark Knight', 'Action', 3.99),
(103, 'Interstellar', 'Sci-Fi', 4.99),
(104, 'The Godfather', 'Drama', 2.99),
(105, 'Toy Story', 'Animation', 2.49);

INSERT INTO rentals (rental_id, customer_id, movie_id, rental_date, return_date) VALUES
(1001, 1, 101, '2025-06-01', '2025-06-03'),
(1002, 2, 102, '2025-06-02', '2025-06-04'),
(1003, 1, 103, '2025-06-05', '2025-06-07'),
(1004, 3, 104, '2025-06-08', '2025-06-10'),
(1005, 4, 105, '2025-06-10', '2025-06-12'),
(1006, 2, 101, '2025-06-12', '2025-06-14');

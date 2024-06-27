-- 1-Find all authors who have published more than 5 books
SELECT a.name, COUNT(b.book_id) AS book_count
FROM authors a, books b
WHERE a.author_id = b.author_id
GROUP BY a.author_id, a.name
HAVING COUNT(b.book_id) > 5;

-- 2-Calculate the average book price for each country
SELECT a.country, AVG(b.price) AS avg_price
FROM Authors a, Books b
WHERE a.author_id = b.author_id
GROUP BY a.country;

-- 3-Retrieve a list of books with author names, sorted by price in descending order, and filterable by a specific year of publication

SELECT b.title, b.price, b.publish_date, a.name AS author_name
FROM Books b, Authors a
WHERE b.author_id = a.author_id
  AND EXTRACT(YEAR FROM b.publish_date) = 2023
ORDER BY b.price DESC;

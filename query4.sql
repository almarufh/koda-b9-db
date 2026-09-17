-- SUB SINGGLE ROW
SELECT p1.product_name, p1.price
FROM products p1
WHERE p1.price > (
  SELECT AVG(price)
  FROM products
);

-- Example 1
SELECT t1.customer_id, t1.amount
FROM transactions t1
WHERE amount >= (
  SELECT AVG(amount)
  FROM transactions t2
  WHERE  t2.customer_id = t1.customer_id
);

--  Example 2
WITH rekap_sales AS (
  SELECT customer_id id, product p, price_per_unit * quantity AS total
  FROM sales
)

SELECT id, p, total
FROM rekap_sales
WHERE total > 30 AND p = 'Keyboard';


-- Example 3
WITH rekap_sales AS (
  SELECT product, COUNT(product) AS total 
  FROM sales
  GROUP BY product
)

SELECT customer_id, product
WHERE product = (
  SELECT product AS name
  FROM rekap_sales
  WHERE total = 1
);

-- Example 4

-- CTE
WITH rekap_sales AS (
  SELECT s.product_id, SUM(s.quantity) AS total
  FROM Sales s
  JOIN Products p ON s.product_id = p.id
  GROUP BY s.product_id
  HAVING SUM(s.quantity) >= 7
)

SELECT p.id, p.name, rs.total, rs.total * p.price AS amount
FROM rekap_sales rs
JOIN Products p ON rs.product_id = p.id;

-- SUB QUERY
SELECT p.id, p.name, rs.total, rs.total * p.price AS amount
FROM (
    SELECT s.product_id, SUM(s.quantity) AS total
    FROM Sales s
    JOIN Products p ON s.product_id = p.id
    GROUP BY s.product_id
) rs
JOIN Products p ON rs.product_id = p.id
WHERE rs.total >= 7;
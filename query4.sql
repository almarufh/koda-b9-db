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
-- BASIC
SELECT s.product_id, p.name, s.quantity, s.quantity * p.price AS total_sales
FROM Sales s
JOIN Products p ON s.product_id = p.id
WHERE s.quantity >= 7;

-- CTE
WITH rekap_sales AS (
  SELECT s.product_id, p.name, s.quantity, s.quantity * p.price AS total_sales
  FROM Sales s
  JOIN Products p ON s.product_id = p.id
) 

SELECT *
FROM rekap_sales
WHERE quantity IN (
  SELECT quantity
  FROM rekap_sales
  WHERE quantity >= 7
);

-- SUB Query
SELECT *
FROM (
  SELECT s.product_id, p.name, s.quantity, s.quantity * p.price AS total_sales
  FROM Sales s
  JOIN Products p ON s.product_id = p.id
)
WHERE quantity IN (
  SELECT s.quantity
  FROM Sales s
  JOIN Products p ON s.product_id = p.id
  WHERE s.quantity >= 7
);

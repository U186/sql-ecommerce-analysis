-- ============================================================
-- FILE: 05_subqueries.sql
-- PROJECT: E-Commerce Customer Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: Nested queries and above-average spend analysis
-- ============================================================

-- Q: Show customers whose spending is above the overall average
SELECT customer_id,
       SUM(total_purchase_amount) AS total_spend
FROM ecommerce_data
GROUP BY customer_id
HAVING SUM(total_purchase_amount) > (
    SELECT AVG(total_purchase_amount) FROM ecommerce_data
);

-- Q: Find the second highest purchase amount
SELECT total_purchase_amount
FROM ecommerce_data
ORDER BY total_purchase_amount DESC
LIMIT 1 OFFSET 1;

-- Q: Find the third highest total spending customer
SELECT customer_name, customer_id,
       SUM(total_purchase_amount) AS total_spending
FROM ecommerce_data
GROUP BY customer_name, customer_id
ORDER BY total_spending DESC
LIMIT 1 OFFSET 2;

-- Q: Find product categories whose total revenue is greater than the overall average category revenue
SELECT product_category,
       SUM(total_purchase_amount) AS category_total
FROM ecommerce_data
GROUP BY product_category
HAVING SUM(total_purchase_amount) > (
    SELECT AVG(category_sum)
    FROM (
        SELECT SUM(total_purchase_amount) AS category_sum
        FROM ecommerce_data
        GROUP BY product_category
    ) sub
);

-- Q: Find customers whose average purchase amount is higher than 5000
SELECT customer_id, customer_name,
       AVG(total_purchase_amount) AS avg_amount
FROM ecommerce_data
GROUP BY customer_id, customer_name
HAVING AVG(total_purchase_amount) > 5000;

-- Q: Find customers whose total spending is greater than the average customer spending
SELECT customer_id, customer_name,
       SUM(total_purchase_amount) AS total_spend
FROM ecommerce_data
GROUP BY customer_id, customer_name
HAVING SUM(total_purchase_amount) > (
    SELECT AVG(total_sp)
    FROM (
        SELECT SUM(total_purchase_amount) AS total_sp
        FROM ecommerce_data
        GROUP BY customer_id, customer_name
    ) sub
);

-- Q: Find purchases that are above the average purchase amount for their product category
SELECT product_price, total_purchase_amount
FROM (
    SELECT product_price,
           total_purchase_amount,
           AVG(total_purchase_amount) OVER (PARTITION BY product_category) AS category_avg
    FROM ecommerce_data
) sub
WHERE total_purchase_amount > category_avg;

-- ============================================================
-- FILE: 03_groupby_having.sql
-- PROJECT: E-Commerce Customer Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: Revenue breakdowns, GROUP BY, HAVING filters
-- ============================================================

-- Q: Show total revenue grouped by product category
SELECT product_category,
       SUM(total_purchase_amount) AS total_revenue
FROM ecommerce_data
GROUP BY product_category;

-- Q: Count number of purchases per payment method
SELECT payment_method,
       COUNT(*) AS total_transactions
FROM ecommerce_data
GROUP BY payment_method;

-- Q: Find total revenue per gender
SELECT gender,
       SUM(total_purchase_amount) AS total_revenue
FROM ecommerce_data
GROUP BY gender
ORDER BY total_revenue DESC;

-- Q: Compare revenue of male vs female customers
SELECT gender,
       SUM(total_purchase_amount) AS revenue
FROM ecommerce_data
GROUP BY gender
ORDER BY revenue DESC;

-- Q: Show product categories where total revenue is above 5000
SELECT product_category,
       SUM(total_purchase_amount) AS total_revenue
FROM ecommerce_data
GROUP BY product_category
HAVING SUM(total_purchase_amount) > 5000;

-- Q: Find customers who made more than 3 purchases
SELECT customer_name,
       SUM(quantity) AS total_purchases
FROM ecommerce_data
GROUP BY customer_name
HAVING SUM(quantity) > 3;

-- Q: Find the top 5 customers by total spending
SELECT customer_name,
       SUM(total_purchase_amount) AS total_spend
FROM ecommerce_data
GROUP BY customer_name
ORDER BY total_spend DESC
LIMIT 5;

-- Q: Which payment method is most popular?
SELECT payment_method,
       COUNT(*) AS total_transactions
FROM ecommerce_data
GROUP BY payment_method
ORDER BY total_transactions DESC
LIMIT 1;

-- Q: Which age group spends the most?
SELECT
    CASE
        WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
        WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
        WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    SUM(total_purchase_amount) AS total_spending
FROM ecommerce_data
GROUP BY age_group
ORDER BY total_spending DESC;

-- Q: Find customers who returned items but still purchased again
SELECT customer_name,
       COUNT(*) AS total_purchases,
       SUM(returns) AS total_returns
FROM ecommerce_data
GROUP BY customer_name
HAVING SUM(returns) > 0
   AND COUNT(*) > 1;

-- Q: Find payment methods used more than 100 times
SELECT payment_method,
       COUNT(*) AS usage_count
FROM ecommerce_data
GROUP BY payment_method
HAVING COUNT(*) > 100;

-- Q: Classify customers into spending categories (Low / Medium / High)
SELECT customer_name,
       SUM(total_purchase_amount) AS total_spending,
       CASE
           WHEN SUM(total_purchase_amount) < 2000 THEN 'Low Spender'
           WHEN SUM(total_purchase_amount) BETWEEN 2000 AND 5000 THEN 'Medium Spender'
           ELSE 'High Spender'
       END AS spending_category
FROM ecommerce_data
GROUP BY customer_name;

-- Q: Classify customers by loyalty (Loyal / Occasional / New)
SELECT customer_name,
       COUNT(quantity) AS purchase_count,
       CASE
           WHEN COUNT(quantity) > 5 THEN 'Loyal'
           WHEN COUNT(quantity) BETWEEN 2 AND 5 THEN 'Occasional'
           ELSE 'New'
       END AS customer_segment
FROM ecommerce_data
GROUP BY customer_name;

-- Q: Which product category has the highest churn rate?
SELECT product_category,
       MAX(churn) AS churn_rate
FROM ecommerce_data
GROUP BY product_category
ORDER BY churn_rate DESC;

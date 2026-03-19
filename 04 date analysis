-- ============================================================
-- FILE: 04_date_analysis.sql
-- PROJECT: E-Commerce Customer Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: Monthly, yearly, and daily revenue trend analysis
-- ============================================================

-- Q: Show purchases made after 2023-01-01
SELECT product_category, purchase_date
FROM ecommerce_data
WHERE purchase_date > '2023-01-01';

-- Q: Find total revenue per month
SELECT EXTRACT(MONTH FROM purchase_date) AS month,
       SUM(total_purchase_amount) AS total_revenue
FROM ecommerce_data
GROUP BY EXTRACT(MONTH FROM purchase_date)
ORDER BY month;

-- Q: Count purchases per year
SELECT EXTRACT(YEAR FROM purchase_date) AS year,
       COUNT(*) AS total_purchases
FROM ecommerce_data
GROUP BY EXTRACT(YEAR FROM purchase_date)
ORDER BY year;

-- Q: Find the day with the highest revenue
SELECT EXTRACT(DAY FROM purchase_date) AS day,
       SUM(total_purchase_amount) AS daily_revenue
FROM ecommerce_data
GROUP BY EXTRACT(DAY FROM purchase_date)
ORDER BY daily_revenue DESC
LIMIT 1;

-- Q: Show average purchase amount per month
SELECT EXTRACT(MONTH FROM purchase_date) AS month,
       AVG(total_purchase_amount) AS avg_revenue
FROM ecommerce_data
GROUP BY EXTRACT(MONTH FROM purchase_date)
ORDER BY month;

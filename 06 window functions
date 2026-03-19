-- ============================================================
-- FILE: 06_window_functions.sql
-- PROJECT: E-Commerce Customer Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: RANK, DENSE_RANK, ROW_NUMBER, LAG, LEAD
-- ============================================================

-- Q: Rank customers based on total spending
SELECT customer_name,
       SUM(total_purchase_amount) AS total_spending,
       RANK() OVER (ORDER BY SUM(total_purchase_amount) DESC) AS spending_rank
FROM ecommerce_data
GROUP BY customer_name;

-- Q: Dense rank customers by spending
SELECT customer_name,
       SUM(total_purchase_amount) AS total_spending,
       DENSE_RANK() OVER (ORDER BY SUM(total_purchase_amount) DESC) AS spend_rank
FROM ecommerce_data
GROUP BY customer_name;

-- Q: Assign row numbers to purchases ordered by amount
SELECT customer_name,
       total_purchase_amount,
       ROW_NUMBER() OVER (ORDER BY total_purchase_amount DESC) AS purchase_rank
FROM ecommerce_data;

-- Q: Rank customers within each gender based on total spending
SELECT *,
       RANK() OVER (PARTITION BY gender ORDER BY total_spending DESC) AS gender_rank
FROM (
    SELECT customer_name, gender,
           SUM(total_purchase_amount) AS total_spending
    FROM ecommerce_data
    GROUP BY customer_name, gender
) t;

-- Q: Show running total of revenue ordered by purchase date
SELECT purchase_date,
       SUM(daily_total) OVER (ORDER BY purchase_date) AS running_total
FROM (
    SELECT purchase_date,
           SUM(total_purchase_amount) AS daily_total
    FROM ecommerce_data
    GROUP BY purchase_date
) t;

-- Q: Show previous purchase amount using LAG
SELECT purchase_date,
       total_purchase_amount,
       LAG(total_purchase_amount) OVER (ORDER BY purchase_date) AS previous_purchase
FROM ecommerce_data;

-- Q: Show next purchase amount using LEAD
SELECT purchase_date,
       total_purchase_amount,
       LEAD(total_purchase_amount) OVER (ORDER BY purchase_date) AS next_purchase
FROM ecommerce_data;

-- Q: Find the top purchase per customer using ROW_NUMBER
SELECT *,
       ROW_NUMBER() OVER (ORDER BY top_purchase DESC) AS top_rank
FROM (
    SELECT customer_name,
           MAX(total_purchase_amount) AS top_purchase
    FROM ecommerce_data
    GROUP BY customer_name
) t;

-- Q: Calculate percentage contribution of each customer to total revenue
SELECT customer_name,
       SUM(total_purchase_amount) AS total_spending,
       ROUND(
           SUM(total_purchase_amount) * 100.0
           / SUM(SUM(total_purchase_amount)) OVER (), 2
       ) AS percent_contribution
FROM ecommerce_data
GROUP BY customer_name
ORDER BY percent_contribution DESC;

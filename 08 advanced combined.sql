-- ============================================================
-- FILE: 08_advanced_combined.sql
-- PROJECT: E-Commerce Customer Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: Complex queries combining multiple SQL concepts
-- ============================================================

-- Q: Find customers who:
--    → Returned items at least once
--    → Have spending above overall average
--    → Are ranked in the top 10 by spending
--    (Uses: Aggregation + Subquery + Window Function)

SELECT *
FROM (
    SELECT customer_id, customer_name,
           SUM(returns) AS returned_items,
           SUM(total_purchase_amount) AS total_spending,
           ROW_NUMBER() OVER (ORDER BY SUM(total_purchase_amount) DESC) AS spend_rank
    FROM ecommerce_data
    GROUP BY customer_id, customer_name
    HAVING SUM(returns) > 0
       AND SUM(total_purchase_amount) > (
           SELECT AVG(overall_avg)
           FROM (
               SELECT SUM(total_purchase_amount) AS overall_avg
               FROM ecommerce_data
               GROUP BY customer_id
           ) sub
       )
) t
WHERE spend_rank <= 10;

-- Q: Find purchases above the average for their product category
--    (Uses: Window Function with PARTITION BY inside subquery)
SELECT product_price, product_category, total_purchase_amount, category_avg
FROM (
    SELECT product_price,
           product_category,
           total_purchase_amount,
           AVG(total_purchase_amount) OVER (PARTITION BY product_category) AS category_avg
    FROM ecommerce_data
) sub
WHERE total_purchase_amount > category_avg;

-- Q: Show customer name, age group, total spending and spending rank within age group
--    (Uses: CASE + GROUP BY + Window Function + Derived Table)
SELECT *,
       RANK() OVER (PARTITION BY age_group ORDER BY total_spending DESC) AS rank_in_group
FROM (
    SELECT customer_name,
        CASE
            WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
            WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
            WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
            ELSE '46+'
        END AS age_group,
        SUM(total_purchase_amount) AS total_spending
    FROM ecommerce_data
    GROUP BY customer_name, age_group
) t;

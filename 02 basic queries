-- ============================================================
-- FILE: 02_basic_queries.sql
-- PROJECT: E-Commerce Customer Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: Basic SELECT, filters, and simple aggregations
-- ============================================================

-- Q: Show all records
SELECT * FROM ecommerce_data;

-- Q: Display customer name, product category, and total purchase amount
SELECT customer_name, product_category, total_purchase_amount
FROM ecommerce_data;

-- Q: Find product categories where payment method is Credit Card
SELECT product_category
FROM ecommerce_data
WHERE payment_method = 'Credit Card';

-- Q: List customers whose age is greater than 40
SELECT customer_name
FROM ecommerce_data
WHERE customer_age > 40;

-- Q: Show purchases where quantity is more than 2
SELECT *
FROM ecommerce_data
WHERE quantity > 2;

-- Q: Find the total purchase amount of all customers
SELECT SUM(total_purchase_amount) AS total_amount
FROM ecommerce_data;

-- Q: Calculate the average product price
SELECT AVG(product_price) AS avg_price
FROM ecommerce_data;

-- Q: Count total number of purchases
SELECT COUNT(quantity) AS total_purchases
FROM ecommerce_data;

-- Q: Find the maximum and minimum purchase amount
SELECT MAX(total_purchase_amount) AS max_amount,
       MIN(total_purchase_amount) AS min_amount
FROM ecommerce_data;

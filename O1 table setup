-- ============================================================
-- FILE: 01_table_setup.sql
-- PROJECT: E-Commerce Customer Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: Create table and load data from CSV
-- ============================================================

CREATE TABLE ecommerce_data (
    Customer_ID           INT,
    Purchase_Date         DATE,
    Product_Category      VARCHAR(50),
    Product_Price         NUMERIC,
    Quantity              NUMERIC,
    Total_Purchase_Amount NUMERIC,
    Payment_Method        VARCHAR(50),
    Customer_Age          NUMERIC,
    Returns               NUMERIC,
    Customer_Name         VARCHAR(50),
    Gender                VARCHAR(10),
    Churn                 NUMERIC
);

-- Load data from CSV file
COPY ecommerce_data
FROM 'C:/sqldata/ecommerce_customer_data_custom_ratios.csv'
DELIMITER ','
CSV HEADER;

-- Verify load
SELECT COUNT(*) FROM ecommerce_data;
SELECT * FROM ecommerce_data LIMIT 10;

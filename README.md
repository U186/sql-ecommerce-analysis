# 🛒 SQL Project – E-Commerce Customer Data Analysis

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-4479A1?style=flat-square&logo=postgresql&logoColor=white)
![Tool](https://img.shields.io/badge/Tool-pgAdmin-336791?style=flat-square)
![Data](https://img.shields.io/badge/Dataset-Kaggle-20BEFF?style=flat-square&logo=kaggle&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)

## 📌 Project Overview

This project analyzes a real-world E-Commerce customer dataset sourced from Kaggle using **PostgreSQL**.  
Every query was written to answer a **real business question** — not just for syntax practice.

The goal: extract actionable insights about customer behavior, revenue patterns, churn, and spending habits that a business could actually use.

---

## 🗂️ Dataset

| Field | Detail |
|---|---|
| **Source** | Kaggle — E-Commerce Customer Data |
| **File** | `ecommerce_customer_data_custom_ratios.csv` |
| **Records** | ~1000+ transactions |
| **Key Columns** | Customer_ID, Purchase_Date, Product_Category, Product_Price, Quantity, Total_Purchase_Amount, Payment_Method, Customer_Age, Returns, Gender, Churn |

---

## ❓ Business Questions Answered

### 📊 Revenue & Sales Analysis
- What is the total revenue across all transactions?
- Which product category generates the highest revenue?
- What is the monthly and yearly revenue trend?
- Which day of the month drives the highest revenue?

### 👤 Customer Analysis
- Who are the top 5 customers by total spending?
- Which customers spend above the overall average?
- How can customers be segmented into Loyal / Occasional / New?
- Which age group spends the most?

### 💳 Payment & Behavior
- Which payment method is most popular?
- Which customers returned items but continued purchasing?
- What percentage of total revenue does each customer contribute?

### 📉 Churn Analysis
- Which product category has the highest churn rate?
- How does revenue differ between churned vs non-churned customers?

### 🏆 Advanced Business Insights
- Rank customers within each gender by spending
- Find customers who returned items, spent above average, AND are in the top 10 spenders
- Identify the top spending customer in each age group
- Show running total of revenue over time

---

## 🧠 SQL Concepts Used

| Concept | Examples Used |
|---|---|
| **Aggregations** | SUM, AVG, COUNT, MAX, MIN |
| **GROUP BY / HAVING** | Revenue by category, customers above average |
| **Window Functions** | RANK(), DENSE_RANK(), ROW_NUMBER(), LAG(), LEAD() |
| **Subqueries** | Customers above average spend, nested filters |
| **JOINs** | INNER JOIN, LEFT JOIN across customers & orders tables |
| **CASE Statements** | Age groups, spending categories, loyalty classification |
| **Date Functions** | EXTRACT(month/year/day), monthly trend analysis |
| **CTEs / Derived Tables** | Running totals, multi-step filtering |
| **Table Design** | Split ecommerce_data into `customers` and `orders` tables |

---

## 📁 File Structure

```
sql-ecommerce-analysis/
│
├── README.md
├── queries/
│   ├── 01_table_setup.sql          -- Table creation & data load
│   ├── 02_basic_queries.sql        -- Filters, aggregations, basic SELECT
│   ├── 03_groupby_having.sql       -- GROUP BY, HAVING, revenue breakdowns
│   ├── 04_date_analysis.sql        -- Monthly, yearly, daily trends
│   ├── 05_subqueries.sql           -- Nested queries, above-average analysis
│   ├── 06_window_functions.sql     -- RANK, DENSE_RANK, LAG, LEAD, ROW_NUMBER
│   ├── 07_joins.sql                -- customers + orders JOIN queries
│   └── 08_advanced_combined.sql    -- Complex multi-concept queries
```

---

## 💡 Key Insights Found

1. **Electronics** category generated the highest total revenue
2. **Credit Card** was the most frequently used payment method
3. The **26–35 age group** had the highest total spending
4. A small segment of customers (~15%) contributed over 40% of revenue
5. Churned customers still generated significant revenue in certain categories
6. Running total analysis revealed **Q4 months** as peak revenue periods

---

## 🛠️ How to Run

1. Install [PostgreSQL](https://www.postgresql.org/download/) and [pgAdmin](https://www.pgadmin.org/)
2. Download the dataset from [Kaggle](https://www.kaggle.com/)
3. Run `01_table_setup.sql` to create and load the table
4. Run query files in order (02 → 08)

---

## 👨‍💻 Author

**Ujjwal Jain**  
B.Sc. E-Commerce Operations & Digital Applications — DSEU, Delhi  
📧 ujjwalj35@gmail.com | [LinkedIn](https://www.linkedin.com/in/ujjwal-jain-37146b303)

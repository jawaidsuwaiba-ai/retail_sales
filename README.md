# retail_sales

# Retail Sales Analysis Project

This project demonstrates **SQL-based data cleaning, exploration, and business analysis** using a retail sales dataset. It showcases the ability to handle missing data, perform aggregate calculations, and derive actionable insights for business decision-making.

## Project Overview

The `retail_sales.db` SQLite database contains a table `retail_sales` with transaction-level data including:

- `transactions_id`  
- `sale_date` and `sale_time`  
- `customer_id`  
- `quantity`  
- `category`  
- `gender`  
- `cogs` (cost of goods sold)  
- `total_sale`  
- `age`  

The dataset was imported from CSV and cleaned to remove null or incomplete records.

---

## Data Cleaning

- Checked for missing values in all key columns.  
- Removed transactions with null values to ensure data integrity.  

```sql
DELETE FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR quantity IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

Data Exploration

Performed basic data exploration to understand dataset characteristics:

Total sales transactions:
SELECT COUNT(*) AS total_sales FROM retail_sales;

Unique customers:
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;

Product categories:
SELECT DISTINCT category FROM retail_sales;

**Business Analysis & Insights**

1. Sales on a specific date (2022-11-05):
SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';

2. High-volume clothing transactions in Nov 2022:
SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND strftime('%Y-%m', sale_date) = '2022-11'
AND quantity >= 4;

3. Total sales per category:
SELECT category, SUM(total_sale) AS net_sale, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

4. Average age of customers buying 'Beauty' products:
SELECT category, AVG(age) AS average_age
FROM retail_sales
WHERE category = 'Beauty'
GROUP BY category;

5. Transactions with total sale > 1000:
SELECT * FROM retail_sales WHERE total_sale > 1000;

6. Total transactions by gender and category:
SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

7. Average monthly sales & best-selling month per year:
SELECT strftime('%Y', sale_date) AS year,
       strftime('%m', sale_date) AS month,
       AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY avg_sale DESC;

8. Top 5 customers by total sales:
SELECT customer_id, SUM(total_sale) AS total_sale
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;

##FINDINGS
~Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
~High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
~Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.
~Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.

##REPORTS
~Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.
~Trend Analysis: Insights into sales trends across different months and shifts.
~Customer Insights: Reports on top customers and unique customer counts per category.

##CONCLUSION
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.




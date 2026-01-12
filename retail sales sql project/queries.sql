select * from retail_sales
 select 
   count (*) 
 from retail_sales

 select * from retail_sales
 where transactions_id is null
 or sale_date is null
 or sale_time is null
 or quantity is null
 or gender is null
 or category is null
 or cogs is null
 or total_sale is null

 delete from retail_sales
 where transactions_id is null
 or sale_date is null
 or sale_time is null
 or quantity is null
 or gender is null
 or category is null
 or cogs is null
 or total_sale is null

 select count (*) from retail_sales

 --Data Exploration--

how many sales we have?
select count (*) as toatl_sale from retail_sales

how many customers we have?
select count (distinct customer_id) as toatl_sale from retail_sales

how many categories we have?
select distinct category from retail_sales

--Data Analysis and Business Key Problems with Solution

1.Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date = '2022-11-05'

2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND strftime('%Y-%m', sale_date) = '2022-11'
AND quantity >= 4;


3.Write a SQL query to calculate the total sales (total_sale) for each category

SELECT category,
SUM(total_sale) AS net_sale,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY 1;

4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select category, avg(age) as average_age from retail_sales
where category= 'Beauty'
group by 1

5.Write a SQL query to find all transactions where the total_sale is greater than 1000

select *
from retail_sales 
where total_sale> 1000

6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category, gender, count (*) as total_trans
from retail_sales
group by category, gender
order by 1

7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT
strftime('%Y', sale_date) AS year,
strftime('%m', sale_date) AS month,
AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY avg_sale DESC;


8.Write a SQL query to find the top 5 customers based on the highest total sales

select customer_id, sum(total_sale) as total_sale
from retail_sales
group by 1
order by 2 desc
limit 5


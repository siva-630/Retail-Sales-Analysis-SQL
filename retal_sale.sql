-- retail sales analysis 

-- create table 
create table retail_sales
                  (

                   transactions_id	int primary key,
                   sale_date	date,
                   sale_time   	time,
                   customer_id	int,
                   gender	 varchar(20),
                   age       int,
                   category  varchar(30),
                   quantiy	  int,
                   price_per_unit  float,
                   cogs	 float,
                   total_sale  float

                   );
-- slect all  data

select * from retail_sales

-- count no of rows
select count(*) from retail_sales;

-- data cleaning

-- check every colume any values are null
select * from retail_sales
where transactions_id is null;

select * from retail_sales
where sale_date is null;

select * from retail_sales
where sale_time is null;

select * from retail_sales
where customer_id is null;

select * from retail_sales
where gender is null;

select * from retail_sales
where age is null;

-- select all rows is null
select * from retail_sales
where 
   transactions_id is null
   or 
   sale_date is null
   or 
   sale_time is null
   or
   customer_id is null
   or
   gender is null
   or
   age is null
   or
   category is null
   or 
   quantiy is null
   or
   price_per_unit is null
   or
   cogs is null
   or
   total_sale is null 
   ;


-- delete records contain null
delete from retail_sales
where 
   transactions_id is null
   or 
   sale_date is null
   or 
   sale_time is null
   or
   customer_id is null
   or
   gender is null
   or
   age is null
   or
   category is null
   or 
   quantiy is null
   or
   price_per_unit is null
   or
   cogs is null
   or
   total_sale is null 
   ;


 -- data exploration

 -- 1.how many sales have ?
 select count(*) as total_sales from retail_sales;

 -- 2.how many unique customers we have ?
 select count(distinct customer_id) as total_customers from retail_sales;

 -- 3.how many unique category?
 select distinct  category  as u_categorys from retail_sales;

-- 4. how gender we have ?
select distinct gender from retail_sales;


-- data analysis

-- 1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:

select * from retail_sales
where sale_date = '2022-11-06';


 -- 2.Write a SQL query to retrieve all transactions where the category is 
 -- 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
select
* 
from retail_sales
where 
   category ='Clothing'
   and
   quantiy >= 4
   and
   to_Char(sale_date,'YYYY-MM') = '2022-11';


-- 3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category, sum(total_sale) as t_sale
from retail_sales
group by 1;

-- 4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.


select 
 round (avg(age),2) as avg
 from retail_sales
 where category = 'Beauty';

-- 5.Write a SQL query to find all transactions where the total_sale is greater than 1000.

select transactions_id from retail_sales
where total_sale >=1000;

-- 6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select 
   category,
   gender,
   count(*) as total
   from retail_sales
   group by
     category,
	 gender

	 order by 1;

-- 7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

 SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1






























 
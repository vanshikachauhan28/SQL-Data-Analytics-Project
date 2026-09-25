-- DATA EXPLORATION

-- Explore all objects in the database
select * from INFORMATION_SCHEMA.TABLES

-- Explore all columns in the database
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='dim_customers'


-- DIMENSION EXPLORATION

-- Explore all the countries from where our customers come from
select distinct country from gold.dim_customers 

-- Explore all the product categories 
select distinct category, subcategory, product_name from gold.dim_products
order by 1,2,3


-- DATE EXPLORATION

-- Find the date of the 1st and last order
-- How many years of sales are available
select 
	min(order_date) as first_order_date,
	max(order_date) as last_order_date,
	datediff(year, min(order_date), max(order_date)) as order_range_months
from gold.fact_sales

-- Find the youngest and the oldest customer
select
	min(birthdate) as oldest_birthdate,
	datediff(year, min(birthdate), getdate()) as oldest_age,
	max(birthdate) as youngest_birthdate,
	datediff(year, max(birthdate), getdate()) as youngest_age
from gold.dim_customers
-- CUSTOMER REPORT

/* 
Purpose: This report consolidates key customer metrics and behaviors

Highlights:
	1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
	3. Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
	4. Calculates valuable KPIs:
	   - recency (months since last order)
	   - average order value
	   - average monthly spend */ 

create view gold.report_customers as
with base_query as (
-- Base query
select
	s.order_number,
	s.product_key,
	s.order_date,
	s.sales_amount,
	s.quantity,
	c.customer_key,
	c.customer_number,
	concat(first_name, ' ', last_name) as customer_name,
	datediff(year, c.birthdate, getdate()) as age
from gold.fact_sales s
left join gold.dim_customers c
on c.customer_key=s.customer_key
where order_date is not null )

-- Customer aggregations
, customer_aggregations as (
select
	customer_key,
	customer_number,
	customer_name,
	age,
	count(distinct order_number) as total_order,
	sum(sales_amount) as total_sales,
	sum(quantity) as total_quantity,
	count(distinct product_key) as total_product,
	max(order_date) as last_order_date,
	datediff(month, min(order_date), max(order_date)) as lifespan
from base_query
group by customer_key,customer_number, customer_name, age )

-- KPIs
select
	customer_key,
	customer_number,
	customer_name,
	age,
	case when age<20 then 'Under 20'
		 when age between 20 and 29 then '20-29'
		 when age between 30 and 39 then '30-39'
		 when age between 40 and 49 then '40-49'
		 when age between 50 and 59 then '50-59'
		 else '60 and Above'
	end as age_group,
	case when lifespan>=12 and total_sales>5000 then 'VIP'
		 when lifespan>= 12 and total_sales<=5000 then 'Regular'
		 else 'New'
	END as customer_segment,
	last_order_date,
	datediff(month, last_order_date, getdate()) as recency,
	total_order,
	total_sales,
	total_quantity,
	total_product,
	lifespan,
	-- compute avg order value
	case when total_order=0 then 0
		 else total_sales / total_order
	END as avg_order_value,
	-- compute avg monthly spend
	case when lifespan=0 then total_sales
		 else total_sales / lifespan
	end as avg_monthly_spend
from customer_aggregations
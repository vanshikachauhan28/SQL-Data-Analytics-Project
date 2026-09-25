-- DATA SEG0ENTATION

-- Segment products in cost ranges and count how many products fall into each category

with product_segment as (
select
	product_key,
	product_name,
	cost,
	case when cost<100 then 'Beow 100'
		 when cost between 100 and 500 then '100-500'
		 when cost between 500 and 1000 then '500-1000'
		 else 'Above 1000' 
	end as cost_range
from gold.dim_products )

select
	cost_range,
	count(product_key) as total_product
from product_segment
group by cost_range
order by total_product

/* Group customers based on their spending behaviour:
	VIP: Custonmers with at least 12 mths of history spending more than 5000
	Regular: Customers with at least 12 mths of history spending 5000 or less
	New: Customers with a lifespan of less than 12 mths
and find the total number of customers in each group */

with customer_spending as (
select
	c.customer_key,
	sum(s.sales_amount) as total_spending,
	min(order_date) as first_order,
	max(order_date) as last_order,
	datediff(month, min(order_date), max(order_date)) as lifespan
from gold.fact_sales s
left join gold.dim_customers c
on c.customer_key=s.customer_key
group by c.customer_key )

select 
customer_segment,
count(customer_key) as total_customers
from (
	select
		customer_key,
		case when lifespan>=12 and total_spending>5000 then 'VIP'
			 when lifespan>= 12 and total_spending<=5000 then 'Regular'
			 else 'New'
		END as customer_segment
	from customer_spending )t
group by customer_segment
order by total_customers desc
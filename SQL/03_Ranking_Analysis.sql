-- RANKING ANALYSIS

-- Top 5 highest revenue generating products
select top 5
p.product_name, sum(s.sales_amount) total_revenue
from gold.fact_sales s
left join gold.dim_products p
on p.product_key=s.product_key
group by p.product_name
order by total_revenue desc

-- Top 5 lowest revenue generating products
select top 5
p.product_name, sum(s.sales_amount) total_revenue
from gold.fact_sales s
left join gold.dim_products p
on p.product_key=s.product_key
group by p.product_name
order by total_revenue 

-- Top 5 best subcategories by revenue generation
select * from (
	select 
	p.subcategory, sum(s.sales_amount) total_revenue,
	row_number() over(order by sum(s.sales_amount) desc) as rank_subcategory
	from gold.fact_sales s
	left join gold.dim_products p
	on p.product_key=s.product_key
	group by p.subcategory )t
where rank_subcategory <= 5

-- Top 10 highest revenue generating customers
select top 10
c.customer_key, c.first_name, c.last_name, 
sum(s.sales_amount) total_revenue
from gold.fact_sales s
left join gold.dim_customers as c
on c.customer_key=s.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_revenue desc

-- Top 3 customers with the fewest orders placed
select top 3
c.customer_key, c.first_name, c.last_name, 
count(distinct order_number) total_orders
from gold.fact_sales s
left join gold.dim_customers as c
on c.customer_key=s.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_orders
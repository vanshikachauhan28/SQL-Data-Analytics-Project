-- PERFORMANCE ANALYSIS

-- Analysing yearly performance of products by comparing it's avg sales and previous year sales

with yearly_product_sales as (
select 
	year(s.order_date) as order_year,
	p.product_name,
	sum(s.sales_amount) as current_sales
from gold.fact_sales s
left join gold.dim_products p
on s.product_key=p.product_key
where order_date is not null
group by year(s.order_date), p.product_name
)

select
	order_year,
	product_name,
	current_sales,
	
	-- Year on Year analysis
	avg(current_sales) over(partition by product_name) as avg_sales,
	current_sales - avg(current_sales) over(partition by product_name) as diff_avg,
	case
		when current_sales - avg(current_sales) over(partition by product_name)>0 then 'Above Avg'
		when current_sales - avg(current_sales) over(partition by product_name)<0 then 'Below Avg'
		else 'Avg'
	end as avg_change,

	lag(current_sales) over(partition by product_name order by order_year) as py_sales,
	current_sales - lag(current_sales) over(partition by product_name order by order_year) as diff_py_year,
	case
		when current_sales - lag(current_sales) over(partition by product_name order by order_year)>0 then 'Increase'
		when current_sales - lag(current_sales) over(partition by product_name order by order_year)<0 then 'Decrease'
		else 'No Change'
	end as py_change
from yearly_product_sales
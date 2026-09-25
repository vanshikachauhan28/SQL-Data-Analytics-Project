-- CUMULATIVE ANALYSIS

-- Total sales per month and
-- Running total of sales over time

select
order_date, total_sales,
-- window function 
sum(total_sales) over (partition by order_date order by order_date asc) as runningg_total_sales
from
(
select
	datetrunc(month, order_date) as order_date,
	sum(sales_amount) as total_sales
from gold.fact_sales
where order_date is not null
group by datetrunc(month, order_date) )t

-- Moving avg
select
order_date, total_sales,
-- window function 
sum(total_sales) over (partition by order_date order by order_date asc) as runningg_total_sales,
avg(avg_price) over (order by order_date) as moving_avg_price
from
(
select
	datetrunc(month, order_date) as order_date,
	sum(sales_amount) as total_sales,
	avg(price) as avg_price
from gold.fact_sales
where order_date is not null
group by datetrunc(month, order_date) )t
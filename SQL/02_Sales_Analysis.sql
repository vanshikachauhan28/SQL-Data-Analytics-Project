-- SALES ANALYSIS

-- Find the total sales
select sum(sales_amount) as total_sales from gold.fact_sales

-- Find how many items are sold
select sum(quantity) as total_qty from gold.fact_sales 

-- Find the avg selling price
select avg(price) as avg_sp from gold.fact_sales 

-- Find the total number of orders
select count(order_number) as total_orders from gold.fact_sales 
select count(distinct order_number) as total_orders from gold.fact_sales 

-- Find the total number of products
select count(distinct product_key) as total_product from gold.dim_products
select count(product_name) as total_product from gold.dim_products

-- Find the total number of customers
select count(customer_key) as total_customers from gold.dim_customers

-- Find the total no. of customers that placed an order
select count(distinct customer_key) as total_customers from gold.fact_sales

-- Generate a report that shows all key metrics of the business
select 'Total Sales' as measure_name, sum(sales_amount) as measure_value from gold.fact_sales
Union All
select 'Total Quantity' as measure_name, sum(quantity) as measure_value from gold.fact_sales
Union All
select 'Avg Price' as measure_name, avg(price) as measure_value from gold.fact_sales
Union All
select 'Total Orders' as measure_name, count(distinct order_number) as measure_value from gold.fact_sales
Union All
select 'Total Products' as measure_name, count(distinct product_key) as measure_value from gold.dim_products
Union All
select 'Total Customers' as measure_name, count(customer_key) as measure_value from gold.dim_customers
Union All
select 'Total Customers Order Placed' as measure_name, count(distinct customer_key) as measure_value from gold.fact_sales
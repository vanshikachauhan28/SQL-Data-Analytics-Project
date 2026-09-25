# SQL-Data-Analytics-Project
End-to-end SQL sales analytics project exploring customer behavior, product performance, sales trends, segmentation, and business KPIs using advanced SQL techniques.

## Project Overview

This project focuses on analyzing sales, customer, and product data using SQL to derive meaningful business insights and evaluate overall business performance.

The analysis covers customer behavior, product performance, sales trends, revenue contribution, customer segmentation, and year-over-year performance.

The project was developed using a relational database containing fact and dimension tables and demonstrates the use of SQL for exploratory analysis, business reporting, and advanced analytical queries.

---

## Project Objectives

The main objectives of this project were to:

- Explore and understand the structure of the database
- Analyze overall sales and business performance
- Identify top and bottom-performing products and customers
- Analyze sales trends over time
- Segment customers based on spending behavior
- Analyze product and category performance
- Calculate cumulative sales and moving averages
- Compare product performance across years
- Generate customer-level analytical reports

---

## Tools & Technologies

- SQL Server Management Studio (SSMS)
- Relational Database
- GitHub

---

## 📊 Analysis Performed

### 1. Data Exploration

Explored:

- Database tables and columns
- Customer countries
- Product categories and subcategories
- Available sales period
- Customer age information

---

### 2. Sales Analysis

Calculated key business metrics including:

- Total Sales
- Total Quantity Sold
- Average Selling Price
- Total Orders
- Total Products
- Total Customers
- Customers Who Placed Orders

A consolidated KPI report was also created to provide an overview of
business performance.

---

### 3. Ranking Analysis

Identified:

- Top 5 revenue-generating products
- Bottom 5 revenue-generating products
- Top 5 revenue-generating subcategories
- Top 10 revenue-generating customers
- Customers with the fewest orders

---

### 4. Trend Analysis

Analyzed sales performance over time at:

- Monthly level
- Yearly level

Metrics analyzed include:

- Total Sales
- Total Customers
- Total Quantity Sold

---

### 5. Magnitude Analysis

Analyzed:

- Customers by country
- Customers by gender
- Products by category
- Average product cost by category
- Revenue by category
- Revenue by customer
- Quantity sold by country

---

### 6. Cumulative Analysis

Used SQL window functions to calculate:

- Monthly sales
- Running sales totals
- Moving average selling prices

---

### 7. Customer Analysis & Reporting

Created a customer-level analytical report containing:

- Customer details
- Age
- Age group
- Total orders
- Total sales
- Total quantity purchased
- Total products purchased
- Last order date
- Customer lifespan
- Recency
- Average order value
- Average monthly spend

Customers were segmented into:

- VIP
- Regular
- New

---

### 8. Data Segmentation

Segmented products based on cost ranges:

- Below 100
- 100–500
- 500–1000
- Above 1000

Customers were also segmented according to their spending behavior and relationship duration.

---

### 9. Part-to-Whole Analysis

Calculated the contribution of each product category to overall sales using window functions.

---

### 10. Product Performance Analysis

Compared yearly product performance using:

- Average sales
- Previous-year sales
- Difference from average
- Year-over-year difference
- Increase/decrease classification

---

## Key SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- DISTINCT
- Aggregate Functions
- CASE Statements
- JOINs
- CTEs
- Subqueries
- UNION ALL
- Window Functions
- ROW_NUMBER()
- LAG()
- SUM() OVER()
- AVG() OVER()
- Date Functions
- DATEDIFF()
- DATETRUNC()
- Customer Segmentation
- Year-over-Year Analysis
- Running Totals
- Moving Averages

---

This project is made with the help and guidance from **Baraa Khatib Salkini**

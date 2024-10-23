# Portfolio Pizza Sales Analyses

# Project Overview
---
This report presents an analysis of pizza sales trends, customer behavior, and overall market performance for a pizza chain using SQL queries. The goal of this project was to extract key insights on sales performance, customer purchasing behavior, and product popularity using various query techniques. Based on the analysis, the report provides actionable recommendations to boost sales and optimize customer engagement.

## Data Collection
The data was collected from the company's internal point-of-sale (POS) system, which tracks each pizza order along with its timestamp, category, and size.

## Data Cleaning and Preprocessing
Before analysis, the following preprocessing steps were conducted:
Duplicate records: Removed duplicate orders to ensure accuracy.
Missing values: Missing entries in the data were replaced with appropriate median values or flagged for exclusion.

## Tools
Excel - Data cleaning and creating report
SQL - Data Analysis

## key Findings
 ### Daily Trend of Total Orders
```sql
select DATENAME(DW, order_date) as day_order, count(distinct order_id) as Total_order 
from pizza_sales
group by DATENAME(DW, order_date)
```


### Result/Findings

Analysis: Daily orders show consistent sales high Wednesday to Saturday while other days are moderate volume of orders.

Insights: Higher sales during Wednesday to Saturday suggest customers are more likely to purchase pizzas for leisure or gatherings.

### Hour Trend for Total Orders
```select DATEPART(HOUR, order_time) as hour_order, count(distinct order_id) as Total_order 
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART (HOUR, order_time)
```


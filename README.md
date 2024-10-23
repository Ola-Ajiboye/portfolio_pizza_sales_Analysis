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
 ### DAILY TREND TOTAL ORDER
```sql
select DATENAME(DW, order_date) as day_order, count(distinct order_id) as Total_order 
from pizza_sales
group by DATENAME(DW, order_date)
```
![image](https://github.com/user-attachments/assets/c76a679a-5c4e-4826-b2bc-ef7d0941bb25)



### Result/Findings

The data shows a clear pattern of daily sales trends. Weekends, particularly Fridays and Saturdays, have the highest number of orders, while weekdays show moderate sales volume. Fridays also see a slight uptick in sales, suggesting that many customers prefer ordering pizza toward the end of the week.

Insight:
The business should focus on preparing for higher sales on weekends. This could involve ramping up marketing efforts during the week and offering weekend specials to capitalize on peak demand.

![aaaa](https://github.com/user-attachments/assets/6f40c15b-a0e6-4839-bb27-aeeacf187669)

### HOUR TREND FOR TOTAL ORDERS

```sql
select DATEPART(HOUR, order_time) as hour_order, count(distinct order_id) as Total_order 
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART (HOUR, order_time)
```
![image](https://github.com/user-attachments/assets/e5539492-fcd5-49cf-8888-b07f0f340abd)

Analysis There are maximum orders from 12pm - 1am & after 5 -8pm which corresponds to typical lunch and dinner hours. 
Insights: Promotions or marketing during peak hours could further drive sales.
Analysis:
The busiest hours for pizza sales are between 12PM - 1AM and 5-:8PM, coinciding with typical dinner hours. A smaller spike occurs around lunchtime, from 12:00 PM to 1PM, while the lowest order volume is observed in the early morning hours (8:00 AM - 11:00 AM).

Insight:
To increase sales during off-peak hours, the business could introduce time-specific promotions (e.g., lunchtime deals or late-night offers). Additionally, focusing marketing efforts on peak times with high-value orders could further drive revenue.

### PERCENTAGE SALES BY PIZZA CATEGORY
```sql
select pizza_category, sum(total_price) as Total_Revenue,
cast(sum(total_price) * 100  / (select sum(total_Price) from pizza_sales) as decimal(10,2)) as Percentage_Sales
from pizza_sales
group by pizza_category
```
![image](https://github.com/user-attachments/assets/40a9d2c6-5859-46f9-b3cb-f50aea660be3)

Insight:
Classic pizzas dominate sales, indicating that customers tend to prefer meat-heavy options. Supreme pizzas also perform well, possibly due to increasing demand for healthier or alternative dietary choices. Chicken pizzas contribute the least to overall sales, which may suggest they are less popular or too niche.
Consider introducing new varieties or promotions to boost sales in underperforming categories (with lower percentage). Alternatively, lower stock on less popular categories to focus on high-demand items.

 ### PERCENTAGE SALES BY PIZZA SIZE
 ```sql
select pizza_size, sum(total_price) as Total_Revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT_Pizza_size
from pizza_sales
group by pizza_size
order by PCT_Pizza_size desc
```



Insight:
Large pizzas are the most popular, likely because they cater to group dining or family meals. Medium pizzas have a solid market, while small pizzas account for a significantly smaller portion of sales.
Recommendation:
Focus on offering bundle deals or discounts on large pizzas, especially during peak hours, to maximize revenue. Consider reevaluating the small pizza offerings or packaging them as part of combo deals to increase sales.

### TOTAL QUANTITY SOLD BT PIZZA CATEGORY
```sql
select pizza_category, sum(quantity)as pizza_sold from pizza_sales
group by pizza_category
order by pizza_sold desc
```

Insight:
Classic pizzas account for the largest total quantity sold, followed by Supreme pizzas, and Chicken pizzas.
Given the strong performance of Classic pizzas, ensure that sufficient stock and ingredients are available to meet demand. The lower quantity of Supreme pizzas sold could warrant either increased promotion or menu adjustments.

### TOP 5 BEST SELLER PIZZA SOLD
```sql
select TOP 5 pizza_name_id, sum(quantity) as Best_seller
from pizza_sales
group by pizza_name_id
order by Best_seller desc
```
![image](https://github.com/user-attachments/assets/d8845292-3b5f-4821-a809-918c0a887274)

Insights: Classic pizzas consistently appear in the best sellers, while smaller sizes (especially Chicken and Hawaiian options) are underperforming.

### TOP 5 WORST SELLER PIZZA SOLD
```sql
select TOP 5 pizza_name_id, sum(quantity) as worst_seller
from pizza_sales
group by pizza_name_id
order by worst_seller asc
```
![image](https://github.com/user-attachments/assets/765bcd6b-51bb-4676-a37a-11e8c87b915d)
Insight:
carre pizzas, particularly those in niche categories like others, are among the lowest performers. This may indicate that customers prefer clasic pizzas for group dining or find the flavor combinations less appealing.

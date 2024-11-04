select * from pizza_sales

--Total Revenue
select sum(total_price) as Total_Revenue 
from pizza_sales

--Average Order Vales
select sum(total_price)/ count(distinct order_id) as Average_Order_Value
from pizza_sales
Total Pizza Sold
select sum(quantity) as Total_Pizza_sold from pizza_sales

--Total Order 
select count(distinct  order_id) Total_orders 
from pizza_sales

--Average pizza Sold
select cast(cast(sum(quantity) as decimal(10,2)) 
/cast(count(distinct order_id) as decimal(10,2)) 
as decimal(10,2)) as Averae_pizzas_by_order 
from pizza_sales

--Daily Trend Total Order
select DATENAME(DW, order_date) as day_order, 
count(distinct order_id) as Total_order 
from pizza_sales
group by DATENAME(DW, order_date)

-- Hour Trend for Total Orders
select DATEPART(HOUR, order_time) as hour_order, 
count(distinct order_id) as Total_order 
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART (HOUR, order_time) 

--PERCENTAGE SALES BY PIZZA CATEGORY
select pizza_category, sum(total_price) as Total_Revenue,
cast(sum(total_price) * 100  / (select sum(total_Price) 
from pizza_sales) as decimal(10,2)) as Percentage_Sales
from pizza_sales
group by pizza_category

--PERCENTAGE SALES BY PIZZA SIZE
select pizza_size, sum(total_price) as Total_Revenue,
cast(sum(total_price) * 100 / (select sum(total_price) 
from pizza_sales) as decimal(10,2)) as PCT_Pizza_size
from pizza_sales
group by pizza_size

-- TOTAL QUANTITY SOLD BT PIZZA CATEGORY
select pizza_category, sum(quantity)as pizza_sold 
from pizza_sales
group by pizza_category
order by pizza_sold desc
--
TOP 5 BEST SELLER PIZZA SOLD
select TOP 5 pizza_name_id, sum(quantity) as Best_seller
from pizza_sales
group by pizza_name_id
order by Best_seller DESC

--- TOP 5 WORST SELLER PIZZA SOLD
select TOP 5 pizza_name_id, sum(quantity) as worst_seller
from pizza_sales
group by pizza_name_id
order by worst_seller ASC


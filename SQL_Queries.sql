-- Q.1 What is the Total Revenue ? 
select SUM(total_price)  as total_revenue from pizza

-- Q.2 What is the average order value?

select SUM(total_price)/count(distinct order_id) as AVg_order from pizza

-- Q.3 How much pizza sold ?
select sum(total_price) as total_pizza_sale from pizza

-- Q.4 count the total order 
select sum(total_price) as total_pizza_sale from pizza


-- Q.5 This SQL query calculates the average quantity of pizzas per order


select cast(cast(SUM(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizza_order from pizza


-- Q.6 Write a SQL query retrieves information about the total number of orders for each day of the week from a table


select DATENAME(dw,order_date) as order_day,
count(distinct order_id) as total_order from pizza group by DATENAME(dw,order_date)

-- Q.7 write a SQL query analyzes the distribution of total orders based on the hour of the day from a table
select datepart(hour,order_time) as order_time,
count(distinct order_id) as total_order from pizza group by datepart(hour,order_time)
order by datepart(hour,order_time)

-- Q.8 write a SQL query retrieves information about the total sales for each pizza category 
--and the percentage of total sales that each category contributes to the overall sales from a table
select pizza_category,sum(total_price)as total_sale,SUM(total_price)*100/(select sum(total_price) from pizza) as PerTotal
from pizza group by pizza_category

select * from orders

--find top 10 highest reveue generating products 
select product_id,sum(quantity*sale_price) as total_revenue
from orders
group by product_id
order by total_revenue desc
limit 10

--find top 5 highest selling products in each region
with cte as (
select region,product_id,sum(sale_price) as sales
from orders
group by region,product_id)
select * from (
select *, row_number() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5



--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
WITH cte AS (
    SELECT
        EXTRACT(YEAR FROM order_date) AS order_year,
        EXTRACT(MONTH FROM order_date) AS order_month,
        SUM(sale_price) AS sales
    FROM orders
    GROUP BY
        EXTRACT(YEAR FROM order_date),
        EXTRACT(MONTH FROM order_date)
)
SELECT
    order_month,
    SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;





--for each category which month had highest sales 
WITH cte AS (
    SELECT
        category,
        TO_CHAR(order_date, 'YYYY-MM') AS order_year_month,
        SUM(sale_price) AS sales
    FROM orders
    GROUP BY
        category,
        TO_CHAR(order_date, 'YYYY-MM'))
SELECT
    category,
    order_year_month,
    sales
FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rn FROM cte) a
WHERE rn = 1;






--which sub category had highest growth by profit in 2023 compare to 2022
WITH cte AS (
    SELECT
        sub_category,
        EXTRACT(YEAR FROM order_date) AS order_year,
        SUM(profit) AS profit
    FROM orders
    GROUP BY
        sub_category,
        EXTRACT(YEAR FROM order_date)
),
cte2 AS (
    SELECT
        sub_category,
        SUM(CASE WHEN order_year = 2022 THEN profit ELSE 0 END) AS profit_2022,
        SUM(CASE WHEN order_year = 2023 THEN profit ELSE 0 END) AS profit_2023
    FROM cte
    GROUP BY sub_category
)

SELECT
    sub_category,
    profit_2022,
    profit_2023,
    (profit_2023 - profit_2022) AS growth
FROM cte2
ORDER BY growth DESC
LIMIT 1;
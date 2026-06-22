-- =====================================================
-- Retail Sales Analysis
-- =====================================================

-- Objective:
-- Analyze retail sales data to uncover insights related to
-- revenue, profitability, product performance, regional trends,
-- and year-over-year growth.

-- =====================================================
-- Business Problem 1
-- Top 10 Revenue Generating Products
-- =====================================================

-- Business Question:
-- Which products generate the highest revenue for the business?

SELECT
product_id,
SUM(quantity * sale_price) AS total_revenue
FROM orders
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Insight:
-- TEC-CO-10004722 was the highest revenue-generating product.

-- =====================================================
-- Business Problem 2
-- Top 5 Revenue Generating Products by Region
-- =====================================================

-- Business Question:
-- Which products generate the highest revenue within each region?

WITH cte AS (
SELECT
region,
product_id,
SUM(quantity * sale_price) AS revenue
FROM orders
GROUP BY region, product_id
)
SELECT *
FROM (
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY region
ORDER BY revenue DESC
) AS rn
FROM cte
) a
WHERE rn <= 5;

-- Insight:
-- Refer to output for top-performing products across regions.

-- =====================================================
-- Business Problem 3
-- Year-over-Year Revenue Comparison (2022 vs 2023)
-- =====================================================

-- Business Question:
-- How did monthly revenue performance change from 2022 to 2023?

WITH cte AS (
SELECT
EXTRACT(YEAR FROM order_date) AS order_year,
EXTRACT(MONTH FROM order_date) AS order_month,
SUM(quantity * sale_price) AS revenue
FROM orders
GROUP BY
EXTRACT(YEAR FROM order_date),
EXTRACT(MONTH FROM order_date)
)
SELECT
order_month,
SUM(CASE WHEN order_year = 2022 THEN revenue ELSE 0 END) AS revenue_2022,
SUM(CASE WHEN order_year = 2023 THEN revenue ELSE 0 END) AS revenue_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;

-- Insight:
-- Refer to output for monthly revenue comparison between 2022 and 2023.

-- =====================================================
-- Business Problem 4
-- Highest Revenue Month by Category
-- =====================================================

-- Business Question:
-- Which month generated the highest revenue for each category?

WITH cte AS (
SELECT
category,
TO_CHAR(order_date, 'YYYY-MM') AS order_year_month,
SUM(quantity * sale_price) AS revenue
FROM orders
GROUP BY
category,
TO_CHAR(order_date, 'YYYY-MM')
)
SELECT
category,
order_year_month,
revenue
FROM (
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY category
ORDER BY revenue DESC
) AS rn
FROM cte
) a
WHERE rn = 1;

-- Insight:
-- Identified the highest revenue-generating month for each category.

-- =====================================================
-- Business Problem 5
-- Highest Profit Growth Sub-Category
-- =====================================================

-- Business Question:
-- Which sub-category experienced the highest profit growth
-- in 2023 compared to 2022?

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

-- Insight:
-- Identified the sub-category with the highest year-over-year profit growth.

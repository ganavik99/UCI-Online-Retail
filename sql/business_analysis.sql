-- =========================================================
-- E-COMMERCE SALES ANALYTICS
-- PostgreSQL Business Analysis
-- =========================================================


-- =========================================================
-- 1. DATASET SUMMARY
-- =========================================================

SELECT
    (SELECT COUNT(*) FROM sales) AS sales_records,
    (SELECT COUNT(*) FROM returns) AS return_records;


-- =========================================================
-- 2. TOTAL REVENUE
-- =========================================================

SELECT
    ROUND(SUM("Revenue")::numeric, 2) AS total_revenue
FROM sales;


-- =========================================================
-- 3. TOTAL RETURN VALUE
-- =========================================================

SELECT
    ROUND(SUM("ReturnValue")::numeric, 2) AS total_return_value
FROM returns;


-- =========================================================
-- 4. NET REVENUE
-- =========================================================

SELECT
    ROUND(
        (
            (SELECT SUM("Revenue") FROM sales)
            -
            (SELECT SUM("ReturnValue") FROM returns)
        )::numeric,
        2
    ) AS net_revenue;


-- =========================================================
-- 5. MONTHLY REVENUE
-- =========================================================

SELECT
    "Year",
    "Month",
    "MonthName",
    ROUND(SUM("Revenue")::numeric, 2) AS revenue
FROM sales
GROUP BY
    "Year",
    "Month",
    "MonthName"
ORDER BY
    "Year",
    "Month";


-- =========================================================
-- 6. TOP 10 PHYSICAL PRODUCTS
-- Excluding postage/manual transactions
-- =========================================================

SELECT
    "StockCode",
    "Description",
    SUM("Quantity") AS units_sold,
    ROUND(SUM("Revenue")::numeric, 2) AS revenue
FROM sales
WHERE
    UPPER("Description") NOT LIKE '%POSTAGE%'
    AND UPPER("Description") NOT LIKE '%MANUAL%'
GROUP BY
    "StockCode",
    "Description"
ORDER BY
    revenue DESC
LIMIT 10;


-- =========================================================
-- 7. REVENUE BY COUNTRY
-- =========================================================

SELECT
    "Country",
    COUNT(DISTINCT "InvoiceNo") AS orders,
    SUM("Quantity") AS units_sold,
    ROUND(SUM("Revenue")::numeric, 2) AS revenue
FROM sales
GROUP BY "Country"
ORDER BY revenue DESC;


-- =========================================================
-- 8. COUNTRY REVENUE CONTRIBUTION
-- =========================================================

SELECT
    "Country",
    ROUND(SUM("Revenue")::numeric, 2) AS revenue,
    ROUND(
        (
            SUM("Revenue") /
            (SELECT SUM("Revenue") FROM sales)
        )::numeric * 100,
        2
    ) AS revenue_percentage
FROM sales
GROUP BY "Country"
ORDER BY revenue DESC;


-- =========================================================
-- 9. TOP 10 CUSTOMERS
-- =========================================================

SELECT
    "CustomerID",
    COUNT(DISTINCT "InvoiceNo") AS orders,
    SUM("Quantity") AS units_purchased,
    ROUND(SUM("Revenue")::numeric, 2) AS revenue
FROM sales
WHERE "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY revenue DESC
LIMIT 10;


-- =========================================================
-- 10. AVERAGE ORDER VALUE
-- =========================================================

SELECT
    ROUND(
        (
            SUM("Revenue") /
            COUNT(DISTINCT "InvoiceNo")
        )::numeric,
        2
    ) AS average_order_value
FROM sales;


-- =========================================================
-- 11. RETURN RATE
-- =========================================================

SELECT
    ROUND(
        (
            (SELECT SUM("ReturnValue") FROM returns)
            /
            (SELECT SUM("Revenue") FROM sales)
            * 100
        )::numeric,
        2
    ) AS return_rate_percentage;


-- =========================================================
-- 12. TOP 10 CUSTOMER REVENUE CONTRIBUTION
-- =========================================================

SELECT
    ROUND(SUM(revenue)::numeric, 2) AS top_10_customer_revenue,
    ROUND(
        (
            SUM(revenue) /
            (SELECT SUM("Revenue") FROM sales)
        )::numeric * 100,
        2
    ) AS top_10_revenue_percentage
FROM (
    SELECT
        "CustomerID",
        SUM("Revenue") AS revenue
    FROM sales
    WHERE "CustomerID" IS NOT NULL
    GROUP BY "CustomerID"
    ORDER BY revenue DESC
    LIMIT 10
) AS top_customers;
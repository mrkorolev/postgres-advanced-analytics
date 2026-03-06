/*
    Customers geolocation analysis metrics

    - The goal of this section is to understand where the customer base is concentrated
      and identify regions with the highest market potential. The analysis also connects
      customer location with purchasing behavior and revenue generation
*/

-- 1) Customer distribution by state
SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS customers_per_state
FROM
    customers
GROUP BY
    ROLLUP(customer_state)
ORDER BY
    customers_per_state DESC;


-- 2) Top Cities by Number of Customers
SELECT
    customer_city,
    COUNT(DISTINCT customer_unique_id) AS customers_per_city
FROM
    customers
GROUP BY
    ROLLUP(customer_city)
ORDER BY
    customers_per_city DESC;

-- 3) Share of customers by state
SELECT
    customer_state,
    ROUND(100.0 * COUNT(DISTINCT customer_unique_id) / (
        SELECT COUNT(DISTINCT customer_unique_id)
        FROM customers
    ), 1) AS customer_share_per_state
FROM
    customers
GROUP BY
    ROLLUP(customer_state)
ORDER BY
    customer_share_per_state DESC;

-- 4) Customer concentration (Pareto Analysis)
-- TODO: remember window functions

-- 5) Average Orders per Customer by State
SELECT
    state,
    ROUND(AVG(orders_count), 2) AS avg_orders_per_customer
FROM (
    SELECT
        customer_state AS state,
        customer_unique_id,
        COUNT(*) AS orders_count
    FROM
        customers
    GROUP BY
        customer_state,
        customer_unique_id
)
GROUP BY
    state
ORDER BY
    avg_orders_per_customer DESC;

-- 6) Revenue by Customer State
SELECT
    c.customer_state AS state,
    SUM(p.payment_value) AS state_revenue
FROM
    customers c
JOIN
    orders o
ON c.customer_id = o.customer_id
JOIN
    order_payments p
ON o.order_id = p.order_id
GROUP BY
    state
ORDER BY
    state_revenue DESC;

-- 7) Revenue per Customer by State
SELECT
    state,
    ROUND(AVG(customer_revenue), 2) AS avg_revenue_per_customer
FROM (
     SELECT
         c.customer_state AS state,
         c.customer_unique_id AS customer_unique_id,
         SUM(p.payment_value) AS customer_revenue
     FROM
         customers c
             JOIN
         orders o
         ON c.customer_id = o.customer_id
             JOIN
         order_payments p
         ON o.order_id = p.order_id
     GROUP BY
         c.customer_state,
         c.customer_unique_id
) q
GROUP BY
    state
ORDER BY
    avg_revenue_per_customer DESC;

-- 8) Top Cities by Revenue per Customer
SELECT
    city,
    ROUND(AVG(customer_revenue), 2) AS avg_revenue_per_customer
FROM (
     SELECT
         c.customer_city AS city,
         c.customer_unique_id AS customer_unique_id,
         SUM(p.payment_value) AS customer_revenue
     FROM
         customers c
             JOIN
         orders o
         ON c.customer_id = o.customer_id
             JOIN
         order_payments p
         ON o.order_id = p.order_id
     GROUP BY
         c.customer_city,
         c.customer_unique_id
) q
GROUP BY
    city
ORDER BY
    avg_revenue_per_customer DESC
LIMIT 10;
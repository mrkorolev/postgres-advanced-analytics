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

-- 4)


-- 5)
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
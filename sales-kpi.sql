SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(order_id) AS orders,
    SUM(revenue) / COUNT(order_id) AS avg_order_value
FROM orders
GROUP BY month
ORDER BY month;

SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(revenue) AS total_revenue,
    AVG(revenue) AS avg_order_value
FROM orders
GROUP BY customer_id
ORDER BY total_revenue DESC;

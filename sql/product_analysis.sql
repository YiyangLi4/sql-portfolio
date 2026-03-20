-- Product type performance with segmentation and value comparison

SELECT 
    product_type,
    COUNT(*) AS total_bookings,
    SUM(booking_value) AS total_revenue,
    ROUND(AVG(booking_value), 2) AS avg_booking_value,
    
    CASE 
        WHEN AVG(booking_value) > 1500 THEN 'High Value'
        WHEN AVG(booking_value) BETWEEN 800 AND 1500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS value_segment

FROM travel_bookings
GROUP BY product_type
ORDER BY total_revenue DESC;

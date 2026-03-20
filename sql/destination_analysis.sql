-- Destination performance with ranking and booking value insights

WITH destination_stats AS (
    SELECT 
        destination,
        COUNT(*) AS total_bookings,
        SUM(booking_value) AS total_revenue,
        AVG(booking_value) AS avg_booking_value
    FROM travel_bookings
    GROUP BY destination
)

SELECT 
    destination,
    total_bookings,
    total_revenue,
    ROUND(avg_booking_value, 2) AS avg_booking_value,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM destination_stats
ORDER BY revenue_rank;

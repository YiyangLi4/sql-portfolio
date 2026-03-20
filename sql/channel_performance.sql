-- Channel performance with revenue contribution and efficiency metrics

WITH channel_metrics AS (
    SELECT 
        channel,
        COUNT(booking_id) AS total_bookings,
        SUM(booking_value) AS total_revenue,
        AVG(booking_value) AS avg_booking_value
    FROM travel_bookings
    GROUP BY channel
),

total AS (
    SELECT SUM(booking_value) AS overall_revenue
    FROM travel_bookings
)

SELECT 
    c.channel,
    c.total_bookings,
    c.total_revenue,
    ROUND(c.avg_booking_value, 2) AS avg_booking_value,
    ROUND(c.total_revenue * 1.0 / t.overall_revenue, 4) AS revenue_share
FROM channel_metrics c
CROSS JOIN total t
ORDER BY c.total_revenue DESC;

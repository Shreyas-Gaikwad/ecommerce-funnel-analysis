-- Purpose: Analyze time-based funnel trends
-- Focus: Weekly conversion behavior to support forecasting

CREATE OR REPLACE VIEW weekly_conversion_rates AS
SELECT
    DATE_TRUNC('week', event_time) AS week,
    COUNT(DISTINCT CASE
        WHEN event_type = 'view' THEN user_id
    END) AS viewers,
    COUNT(DISTINCT CASE
        WHEN event_type = 'purchase' THEN user_id
    END) AS buyers,
    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN event_type = 'purchase' THEN user_id
        END)
        / NULLIF(COUNT(DISTINCT CASE
            WHEN event_type = 'view' THEN user_id
        END), 0),
        2
    ) AS conversion_rate
FROM base_events
GROUP BY week
ORDER BY week;

SELECT * FROM weekly_conversion_rates LIMIT 10;
-- Purpose: Analyze funnel conversion across user segments
-- Focus: Identify high- and low-converting user groups

SELECT
    u.gender,
    COUNT(*) AS users,
    SUM(uf.purchased) AS purchasers,
    ROUND(
        100.0 * SUM(uf.purchased) / COUNT(*),
        2
    ) AS conversion_rate
FROM user_funnel uf
JOIN users u
    ON uf.user_id = u.user_id
GROUP BY u.gender
ORDER BY conversion_rate DESC;

-- Segment: City
SELECT
    u.city,
    COUNT(*) AS users,
    SUM(uf.purchased) AS purchasers,
    ROUND(
        100.0 * SUM(uf.purchased) / COUNT(*),
        2
    ) AS conversion_rate
FROM user_funnel uf
JOIN users u
    ON uf.user_id = u.user_id
GROUP BY u.city
HAVING COUNT(*) >= 100
ORDER BY conversion_rate DESC;

SELECT
    city,
    COUNT(*) AS users
FROM users
GROUP BY city
ORDER BY users DESC
LIMIT 10;

SELECT
    COUNT(*) AS total_funnel_users,
    COUNT(u.user_id) AS users_with_city
FROM user_funnel uf
LEFT JOIN users u
    ON uf.user_id = u.user_id;

SELECT
    u.city,
    COUNT(*) AS users,
    SUM(uf.purchased) AS purchasers,
    ROUND(
        100.0 * SUM(uf.purchased) / COUNT(*),
        2
    ) AS conversion_rate
FROM user_funnel uf
JOIN users u
    ON uf.user_id = u.user_id
GROUP BY u.city
ORDER BY users DESC
LIMIT 10;

-- Segment: Signup Cohort (Monthly)
SELECT
    DATE_TRUNC('month', u.signup_date) AS signup_month,
    COUNT(*) AS users,
    SUM(uf.purchased) AS purchasers,
    ROUND(
        100.0 * SUM(uf.purchased) / COUNT(*),
        2
    ) AS conversion_rate
FROM user_funnel uf
JOIN users u
    ON uf.user_id = u.user_id
GROUP BY signup_month
ORDER BY signup_month;

-- Segment: Product Category Conversion
SELECT
    p.category,
    COUNT(DISTINCT e.user_id) AS viewers,
    COUNT(DISTINCT CASE
        WHEN e.event_type = 'purchase' THEN e.user_id
    END) AS buyers,
    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN e.event_type = 'purchase' THEN e.user_id
        END)
        / NULLIF(COUNT(DISTINCT e.user_id), 0),
        2
    ) AS conversion_rate
FROM base_events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type IN ('view', 'purchase')
GROUP BY p.category
ORDER BY conversion_rate DESC;
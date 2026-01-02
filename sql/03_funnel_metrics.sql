SELECT
    COUNT(*) AS total_users,
    SUM(viewed) AS users_viewed,
    SUM(added_to_cart) AS users_carted,
    SUM(wishlisted) AS users_wishlisted,
    SUM(purchased) AS users_purchased,
    ROUND(
        100.0 * SUM(purchased) / NULLIF(SUM(viewed), 0),
        2
    ) AS view_to_purchase_rate
FROM user_funnel;

SELECT
    'View → Cart' AS stage,
    SUM(viewed) - SUM(added_to_cart) AS users_dropped
FROM user_funnel
UNION ALL
SELECT
    'Cart → Purchase',
    SUM(added_to_cart) - SUM(purchased)
FROM user_funnel;
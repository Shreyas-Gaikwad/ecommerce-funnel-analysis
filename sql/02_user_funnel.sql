-- Purpose: Create user-level funnel table
-- Analyst decisions:
-- - Funnel is user-level
-- - Repeated events allowed
-- - Conversion = at least one purchase

CREATE OR REPLACE VIEW user_funnel AS
SELECT
    user_id,
    MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
    MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS added_to_cart,
    MAX(CASE WHEN event_type = 'wishlist' THEN 1 ELSE 0 END) AS wishlisted,
    MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchased
FROM base_events
GROUP BY user_id;

SELECT
    COUNT(*) AS users,
    SUM(viewed) AS viewed_users,
    SUM(purchased) AS purchasers
FROM user_funnel;
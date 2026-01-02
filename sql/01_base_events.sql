-- Project: Product Funnel Optimization
-- Purpose: Create clean base event table for funnel analysis

INSTALL httpfs;
LOAD httpfs;

CREATE OR REPLACE TABLE events AS
SELECT * FROM read_csv_auto('C:\Projects\productFunnelOptimization\data\events.csv');

CREATE OR REPLACE TABLE users AS
SELECT * FROM read_csv_auto('C:\Projects\productFunnelOptimization\data\users.csv');

CREATE OR REPLACE TABLE products AS
SELECT * FROM read_csv_auto('C:\Projects\productFunnelOptimization\data\products.csv');

SELECT COUNT(*) FROM events;
SELECT DISTINCT event_type FROM events;
SELECT COUNT(DISTINCT user_id) FROM events;

CREATE OR REPLACE VIEW base_events AS
SELECT
    user_id,
    product_id,
    event_type,
    CAST(event_timestamp AS TIMESTAMP) AS event_time
FROM events
WHERE event_type IN ('view', 'cart', 'wishlist', 'purchase');

SELECT
    event_type,
    COUNT(*)
FROM base_events
GROUP BY event_type;
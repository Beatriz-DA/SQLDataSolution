-- ============================
-- 1. Total Events per Company
-- ============================
-- This query shows how many events each company is organizing.
-- Important because it highlights the most active companies and potential key partners.
SELECT c.name AS company_name, COUNT(e.id) AS total_events
FROM tbl_companies c
JOIN tbl_events e ON c.id = e.company_id
GROUP BY c.name
ORDER BY total_events DESC;

-- ============================
-- 2. Events per Category
-- ============================
-- Counts how many events exist in each category (Festival, Conference, Marathon, etc.).
-- Important for understanding which types of events dominate the portfolio.
SELECT cat.name AS category_name, COUNT(e.id) AS total_events
FROM tbl_events e
JOIN tbl_categories cat ON e.category_id = cat.id
GROUP BY cat.name
ORDER BY total_events DESC;

-- ============================
-- 3. Events by Year
-- ============================
-- Groups events by year to see growth or decline in activity.
-- Important for long-term planning and trend analysis.
SELECT EXTRACT(YEAR FROM e.event_date) AS year, COUNT(e.id) AS total_events
FROM tbl_events e
GROUP BY year
ORDER BY year;

-- ============================
-- 4. Upcoming Events in a City
-- ============================
-- Lists all events scheduled in New York in 2026.
-- Important for local marketing and logistics planning.
SELECT event_name, event_date, venue
FROM tbl_events
WHERE city = 'New York'
  AND EXTRACT(YEAR FROM event_date) = 2026
ORDER BY event_date;

-- ============================
-- 5. Top Events by Clicks
-- ============================
-- Ranks events by click_count (engagement with ticket links).
-- Important for identifying the most popular events and allocating resources.
SELECT event_name, click_count
FROM tbl_events
ORDER BY click_count DESC
LIMIT 5;

-- ============================
-- 6. Clicks per Category
-- ============================
-- Aggregates total clicks by category.
-- Important for measuring audience interest across event types.
SELECT cat.name AS category_name, SUM(e.click_count) AS total_clicks
FROM tbl_events e
JOIN tbl_categories cat ON e.category_id = cat.id
GROUP BY cat.name
ORDER BY total_clicks DESC;

-- ============================
-- 7. Average Clicks per Event
-- ============================
-- Calculates the average engagement per event.
-- Important for benchmarking performance and setting realistic goals.
SELECT AVG(click_count) AS avg_clicks_per_event
FROM tbl_events;

-- ============================
-- 8. Events with Low Engagement
-- ============================
-- Finds events with fewer than 5 clicks.
-- Important for identifying events that need more promotion.
SELECT event_name, click_count
FROM tbl_events
WHERE click_count < 5
ORDER BY click_count ASC;

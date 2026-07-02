
-- Constraints

-- Ensure postal codes are numeric
ALTER TABLE tbl_events
ADD CONSTRAINT chk_postal_code CHECK (postal_code ~ '^[0-9]+$');

-- Ensure event_date is not in the past
ALTER TABLE tbl_events
ADD CONSTRAINT chk_event_date CHECK (event_date >= CURRENT_DATE);

-- Make company names unique
ALTER TABLE tbl_companies
ADD CONSTRAINT unique_company_name UNIQUE (name);

-- ============================

-- Indexes

-- Index on event_date for faster queries by date
CREATE INDEX idx_event_date ON tbl_events(event_date);

-- Index on company_id for faster joins
CREATE INDEX idx_event_company ON tbl_events(company_id);

-- Index on category_id for category-based reports
CREATE INDEX idx_event_category ON tbl_events(category_id);

-- ============================

-- Views

-- View: Popular Events
-- Shows top 5 events by click_count
CREATE OR REPLACE VIEW popular_events AS
SELECT event_name, click_count
FROM tbl_events
ORDER BY click_count DESC
LIMIT 5;

-- View: Events per Company
-- Summarizes how many events each company organizes
CREATE OR REPLACE VIEW events_per_company AS
SELECT c.name AS company_name, COUNT(e.id) AS total_events
FROM tbl_companies c
JOIN tbl_events e ON c.id = e.company_id
GROUP BY c.name;

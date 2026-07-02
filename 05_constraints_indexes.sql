
-- Constraints

-- Ensure postal codes are always positive numbers
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

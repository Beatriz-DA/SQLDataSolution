-- ============================
-- Schema Alterations
-- ============================

-- Remove the license column from tbl_companies
ALTER TABLE tbl_companies
DROP COLUMN license;

-- Add event_name column to tbl_events
ALTER TABLE tbl_events
ADD COLUMN event_name VARCHAR(255);

-- Optionally enforce NOT NULL after filling values
-- ALTER TABLE tbl_events
-- ALTER COLUMN event_name SET NOT NULL;

-- ============================
-- Data Updates
-- ============================

-- Fill event_name for existing events
UPDATE tbl_events
SET event_name = 'Ultra Music Festival 2026'
WHERE company_id = 21;

UPDATE tbl_events
SET event_name = 'Glastonbury Festival 2026'
WHERE company_id = 22;

UPDATE tbl_events
SET event_name = 'Web Summit Lisbon 2026'
WHERE company_id = 23;

UPDATE tbl_events
SET event_name = 'TED Global Conference 2026'
WHERE company_id = 24;

UPDATE tbl_events
SET event_name = 'Google I/O 2026'
WHERE company_id = 25;

UPDATE tbl_events
SET event_name = 'Microsoft Build 2026'
WHERE company_id = 26;

UPDATE tbl_events
SET event_name = 'Berlin Marathon 2026'
WHERE company_id = 27;

UPDATE tbl_events
SET event_name = 'New York City Marathon 2026'
WHERE company_id = 28;

UPDATE tbl_events
SET event_name = 'X Games Aspen 2026'
WHERE company_id = 29;

UPDATE tbl_events
SET event_name = 'Venice Biennale 2026'
WHERE company_id = 30;

UPDATE tbl_events
SET event_name = 'Frieze London 2026'
WHERE company_id = 31;

UPDATE tbl_events
SET event_name = 'Sundance Film Festival 2026'
WHERE company_id = 32;

UPDATE tbl_events
SET event_name = 'Toronto International Film Festival 2026'
WHERE company_id = 33;

UPDATE tbl_events
SET event_name = 'National Theatre Premiere 2026'
WHERE company_id = 34;

UPDATE tbl_events
SET event_name = 'Broadway Revival 2026'
WHERE company_id = 35;

-- ============================
-- Click Tracking Feature
-- ============================

-- Add click_count column to track engagement
ALTER TABLE tbl_events
ADD COLUMN click_count INT DEFAULT 0;

-- Simulate clicks
UPDATE tbl_events
SET click_count = click_count + 5
WHERE event_name = 'Ultra Music Festival 2026';

UPDATE tbl_events
SET click_count = click_count + 12
WHERE event_name = 'Web Summit Lisbon 2026';

UPDATE tbl_events
SET click_count = click_count + 20
WHERE event_name = 'Berlin Marathon 2026';

UPDATE tbl_events
SET click_count = click_count + 8
WHERE event_name = 'Venice Biennale 2026';

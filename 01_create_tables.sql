CREATE TABLE tbl_companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    tax_id VARCHAR(50) UNIQUE NOT NULL, 
    registration_country VARCHAR(100),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    contact_person_name VARCHAR(150),
    contact_person_email VARCHAR(150),
    contact_person_phone VARCHAR(50));

COMMENT ON COLUMN tbl_companies.tax_id IS 'International tax identification of the company (CNPJ in Brazil, EIN in the US, VAT in Europe).';

COMMENT ON COLUMN tbl_companies.registration_country IS 'Country of origin for the company''s tax registration.';

COMMENT ON COLUMN tbl_companies.contact_person_name IS 'Name of the primary Point of Contact (PoC). Note: If the platform scales to require multiple corporate users per company, this flat structure should be migrated into a dedicated "tbl_company_members" table.';

COMMENT ON COLUMN tbl_companies.contact_person_email IS 'Direct email of the primary PoC. To be replaced by a relational 1-to-many user table if multiple company representatives are needed in future iterations.';

CREATE TABLE tbl_users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password_hash TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE tbl_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INT REFERENCES tbl_categories(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE tbl_events (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL REFERENCES tbl_companies(id) ON DELETE CASCADE,
    category_id INT NOT NULL REFERENCES tbl_categories(id) ON DELETE CASCADE,
    license VARCHAR(255) NOT null, 
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    venue VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    ticket_link TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

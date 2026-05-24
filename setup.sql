-- CREATE TABLES FOR THE INVESTMENT INTELLIGENCE PLATFORM

CREATE TABLE companies (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100),
    sector VARCHAR(50),
    country VARCHAR(50)
);



CREATE TABLE stock_prices (
    id SERIAL PRIMARY KEY,
    company_id INT,
    trade_date DATE,
    close_price DECIMAL,
    volume BIGINT
);


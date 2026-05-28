-- CREATE TABLES FOR THE INVESTMENT INTELLIGENCE PLATFORM

-- PROPER SCHEMA WITH CONSTRAINTS AND INDEXES

-- TABLE: COMPANIES
CREATE TABLE companies (
    company_id    SERIAL PRIMARY KEY,
    company_name  VARCHAR(150) NOT NULL,
    sector        VARCHAR(50)  NOT NULL,
    country       VARCHAR(50)  NOT NULL,
    founded_year  INT          CHECK (founded_year BETWEEN 1800 AND 2025),
    market_cap_category VARCHAR(20) CHECK (market_cap_category IN ('Large Cap','Mid Cap','Small Cap'))
);

-- TABLE: STOCK_PRICES
CREATE TABLE stock_prices (
    price_id      SERIAL PRIMARY KEY,
    company_id    INT          NOT NULL REFERENCES companies(company_id),
    trade_date    DATE         NOT NULL,
    open_price    NUMERIC(10,2) NOT NULL,
    close_price   NUMERIC(10,2) NOT NULL,
    high_price    NUMERIC(10,2) NOT NULL,
    low_price     NUMERIC(10,2) NOT NULL,
    volume        BIGINT       NOT NULL,
    CONSTRAINT chk_prices CHECK (high_price >= low_price)
);

-- PERFORMANCE INDEXES (this is what seniors check)
CREATE INDEX idx_stock_company ON stock_prices(company_id);
CREATE INDEX idx_stock_date    ON stock_prices(trade_date);
CREATE INDEX idx_company_sector ON companies(sector);

-- ANALYST RATINGS (simulates real analyst coverage data)
CREATE TABLE analyst_ratings (
    rating_id     SERIAL PRIMARY KEY,
    company_id    INT NOT NULL REFERENCES companies(company_id),
    analyst_firm  VARCHAR(100),
    rating        VARCHAR(20) CHECK (rating IN ('Strong Buy','Buy','Hold','Sell','Strong Sell')),
    target_price  NUMERIC(10,2),
    rating_date   DATE NOT NULL
);

-- FINANCIAL METRICS (quarterly fundamentals)
CREATE TABLE financials (
    fin_id        SERIAL PRIMARY KEY,
    company_id    INT NOT NULL REFERENCES companies(company_id),
    fiscal_year   INT NOT NULL,
    fiscal_quarter INT CHECK (fiscal_quarter BETWEEN 1 AND 4),
    revenue       NUMERIC(15,2),
    net_profit    NUMERIC(15,2),
    eps           NUMERIC(8,4),   -- earnings per share
    pe_ratio      NUMERIC(8,2)    -- price-to-earnings
);

-- MARKET EVENTS (news events that move prices)
CREATE TABLE market_events (
    event_id      SERIAL PRIMARY KEY,
    event_date    DATE NOT NULL,
    event_type    VARCHAR(50) CHECK (event_type IN ('Earnings','Merger','Dividend','Regulatory','Macro')),
    affected_sector VARCHAR(50),
    event_description TEXT,
    market_impact VARCHAR(10) CHECK (market_impact IN ('Positive','Negative','Neutral'))
);




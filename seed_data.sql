-- SEED DATA FOR COMPANIES AND STOCK PRICES
-- INSERTING AUTO GENERATED COMPANIES
INSERT INTO companies
(company_name,sector,country,founded_year,market_cap_category)

SELECT

(ARRAY[
'Global','Quantum','Nova','Vertex','Zenith',
'Prime','Elite','Pioneer','Dynamic','Future',
'Apex','Summit','Vision','United','NextGen',
'BlueSky','Core','Alpha','Omega','Everest',
'Fusion','Synergy','Momentum','Horizon',
'Velocity','Titan','Matrix','Orbit',
'Pinnacle','Sterling','Infinity',
'Innovate','Phoenix','Crest','Spark',
'Galaxy','Vector','Impact','Alliance'
])[((random()*38)::int+1)]

|| ' ' ||

(ARRAY[
'Technologies',
'Capital',
'Healthcare',
'Motors',
'Energy',
'Industries',
'Finance',
'Solutions',
'Logistics',
'Pharma',
'Digital',
'Networks',
'Manufacturing',
'Retail',
'Consulting',
'Ventures',
'Electronics',
'Software',
'Biotech',
'Telecom',
'Infrastructure',
'Foods',
'Media',
'Analytics',
'Resources',
'Services',
'Engineering',
'Trading',
'Holdings'
])[((random()*28)::int+1)]

|| ' ' ||

(ARRAY[
'Ltd',
'Corp',
'Group',
'Inc',
'Holdings',
'PLC'
])[((random()*5)::int+1)],

(ARRAY[
'Technology',
'Finance',
'Healthcare',
'Automobile',
'Energy'
])[((random()*4)::int+1)],

(ARRAY[
'USA',
'India',
'Germany',
'UK',
'Japan'
])[((random()*4)::int+1)],

(1980 + (random()*44)::int),

(ARRAY[
'Large Cap',
'Mid Cap',
'Small Cap'
])[((random()*2)::int+1)]

FROM generate_series(1,5000);


SELECT COUNT(*) FROM companies; -- VERIFYING NUMBER OF COMPANIES INSERTED


-- INSERTING AUTO GENERATED STOCK PRICES FOR THE COMPANIES

INSERT INTO stock_prices
(company_id,trade_date,
open_price,close_price,
high_price,low_price,
volume)

SELECT

company_id,

CURRENT_DATE - ((random()*365)::int),

base_price,

ROUND(
(base_price + ((random()-0.5)*20))::numeric
,2),

ROUND(
(base_price + (random()*30))::numeric
,2),

ROUND(
(base_price - (random()*30))::numeric
,2),

(random()*1000000)::bigint

FROM
(
SELECT
company_id,

ROUND(
(50 + random()*950)::numeric
,2) AS base_price

FROM companies

CROSS JOIN generate_series(1,50)

) x;

SELECT COUNT(*) FROM stock_prices; -- VERIFYING NUMBER OF STOCK PRICE RECORDS INSERTED


--- INSERTING AUTO GENERATED ANALYST RATINGS FOR THE COMPANIES
INSERT INTO analyst_ratings
(company_id, analyst_firm, rating, target_price, rating_date)

SELECT

company_id,

(ARRAY[
'Goldman Sachs',
'Morgan Stanley',
'JP Morgan',
'HDFC Securities',
'ICICI Direct'
])[((random()*4)::int+1)],

(ARRAY[
'Strong Buy',
'Buy',
'Hold',
'Sell',
'Strong Sell'
])[((random()*4)::int+1)],

ROUND((100 + random()*1100)::numeric,2),

CURRENT_DATE - ((random()*180)::int)

FROM companies

CROSS JOIN generate_series(1,3);

SELECT COUNT(*) FROM analyst_ratings; -- VERIFYING NUMBER OF ANALYST RATINGS INSERTED

INSERT INTO financials
(company_id,
fiscal_year,
fiscal_quarter,
revenue,
net_profit,
eps,
pe_ratio)

SELECT

company_id,

2024 - (g % 2),

(g % 4)+1,

ROUND((50000000 + random()*450000000)::numeric,2),

ROUND(((-10000000)+(random()*60000000))::numeric,2),

ROUND(((-5)+(random()*105))::numeric,4),

ROUND((5 + random()*75)::numeric,2)

FROM companies

CROSS JOIN generate_series(1,8) g;

SELECT COUNT(*) FROM financials; -- VERIFYING NUMBER OF FINANCIAL RECORDS INSERTED


INSERT INTO market_events
(event_date,
event_type,
affected_sector,
event_description,
market_impact)

SELECT

CURRENT_DATE - ((random()*365)::int),

(ARRAY[
'Earnings',
'Merger',
'Dividend',
'Regulatory',
'Macro'
])[((random()*4)::int+1)],

(ARRAY[
'Technology',
'Finance',
'Healthcare',
'Automobile',
'Energy'
])[((random()*4)::int+1)],

(ARRAY[
'Quarterly earnings beat expectations',
'Major acquisition announced',
'Regulatory policy update',
'Dividend payout declaration',
'Interest rate change impact',
'Sector-wide demand increase',
'Government policy announcement',
'Global macroeconomic shock'
])[((random()*7)::int+1)],

(ARRAY[
'Positive',
'Negative',
'Neutral'
])[((random()*2)::int+1)]

FROM generate_series(1,500);

SELECT COUNT(*) FROM market_events; -- VERIFYING NUMBER OF MARKET EVENTS INSERTED
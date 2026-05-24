-- SEED DATA FOR COMPANIES AND STOCK PRICES
-- INSERTING AUTO GENERATED COMPANIES
INSERT INTO companies(company_name,sector,country)

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
])[floor(random()*40+1)]

|| ' ' ||

(ARRAY[
'Technologies',
'Capital',
'Healthcare',
'Motors',
'Energy',
'Industries',
'Finance',
'Systems',
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
])[floor(random()*30+1)]

|| ' ' ||

(ARRAY[
'Ltd',
'Corp',
'Group',
'Inc',
'Holdings',
'PLC'
])[floor(random()*6+1)],

(ARRAY[
'Technology',
'Finance',
'Healthcare',
'Automobile',
'Energy'
])[floor(random()*5+1)],

(ARRAY[
'USA',
'India',
'Germany',
'UK',
'Japan'
])[floor(random()*5+1)]

FROM generate_series(1,5000);


-- INSERTING AUTO GENERATED STOCK PRICES FOR THE COMPANIES
INSERT INTO stock_prices
(company_id,trade_date,close_price,volume)
SELECT
company_id,
CURRENT_DATE - ((random()*365)::int),
ROUND((random()*1000)::numeric,2),
(random()*1000000)::bigint
FROM companies
CROSS JOIN generate_series(1,50);


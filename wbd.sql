-- Creating table name bank
CREATE TABLE bank(
    Country VARCHAR(50),
    Country_Code VARCHAR(10),
    Debt_Indicator VARCHAR(100),
    Debt_Indicator_Code VARCHAR(25),
    Debt NUMERIC
)

-- Viewing the dataset
SELECT * FROM bank
LIMIT 10

-- Number of distinct Countries and Debt_Indicators
SELECT 
    COUNT(DISTINCT country) AS total_distinct_countries,
    COUNT(DISTINCT DEBT_indicator_code) AS distinct_debt_indicators
FROM bank

-- Total amount of debt on a global scale
SELECT ROUND(SUM(debt)/1000000000,2) AS total_debt
FROM bank

-- Top 10 countries  with the highest debt
SELECT country, ROUND(SUM(debt)/1000000000,2) AS total_debt
FROM bank
GROUP BY country
ORDER BY total_debt DESC
LIMIT 10

-- Top 10 debt indicators with the highest average amount of debt
SELECT debt_indicator,debt_indicator_code, ROUND(AVG(debt)/1000000000,2) AS average_debt
FROM bank
GROUP BY debt_indicator_code, debt_indicator
ORDER BY average_debt DESC
LIMIT 10

-- Top 10 countries having the highest amount of debt indicator i.e. GNI (current US$)
SELECT country, debt_indicator, ROUND(debt/1000000000) AS debt
FROM bank
WHERE debt_indicator_code='NY.GNP.MKTP.CD'
ORDER BY debt DESC
LIMIT 10

-- Most common debt indicator
SELECT debt_indicator_code,COUNT(debt_indicator_code) AS debt_indicator
FROM bank
GROUP BY debt_indicator_code
ORDER BY debt_indicator DESC, debt_indicator_code DESC
-- As Number of country * Number of debt indicators = Number of rows
-- So there is no common indicator

-- Top 10 countries with the maximum amount of debt owed
SELECT country,ROUND(MAX(debt)/1000000000) AS maximum_debt
FROM bank
GROUP BY country
ORDER BY maximum_debt DESC
LIMIT 10

-- Top 10 debt indicators having the maximum amount of debt 
SELECT debt_indicator_code,ROUND(MAX(debt)/1000000000) AS maximum_debt
FROM bank
GROUP BY debt_indicator_code
ORDER BY maximum_debt DESC
LIMIT 10
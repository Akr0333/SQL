USE covid19_analysis;

-- Overall totals
SELECT SUM(confirmed_cases) AS total_cases,
       SUM(deaths) AS total_deaths,
       SUM(recovered) AS total_recovered
FROM DailyStats;

-- Region totals
SELECT region,
       MAX(confirmed_cases) AS peak_reported_cases,
       MAX(deaths) AS peak_reported_deaths,
       MAX(recovered) AS peak_reported_recovered
FROM DailyStats
GROUP BY region
ORDER BY peak_reported_cases DESC;

-- Case fatality rate
SELECT region,
       ROUND(100.0 * MAX(deaths) / NULLIF(MAX(confirmed_cases), 0), 2) AS fatality_rate_percent
FROM DailyStats
GROUP BY region
ORDER BY fatality_rate_percent DESC;

-- Recovery rate
SELECT region,
       ROUND(100.0 * MAX(recovered) / NULLIF(MAX(confirmed_cases), 0), 2) AS recovery_rate_percent
FROM DailyStats
GROUP BY region
ORDER BY recovery_rate_percent DESC;

-- Monthly/dated trend
SELECT report_date,
       SUM(confirmed_cases) AS cases,
       SUM(deaths) AS deaths,
       SUM(recovered) AS recovered
FROM DailyStats
GROUP BY report_date
ORDER BY report_date;

-- Rank regions by reported cases on each date
SELECT report_date, region, confirmed_cases,
       RANK() OVER (PARTITION BY report_date ORDER BY confirmed_cases DESC) AS case_rank
FROM DailyStats
ORDER BY report_date, case_rank;
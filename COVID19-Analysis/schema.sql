CREATE DATABASE IF NOT EXISTS covid19_analysis;
USE covid19_analysis;

CREATE TABLE DailyStats (
    record_id INT PRIMARY KEY,
    report_date DATE NOT NULL,
    region VARCHAR(100) NOT NULL,
    confirmed_cases INT NOT NULL CHECK (confirmed_cases >= 0),
    deaths INT NOT NULL CHECK (deaths >= 0),
    recovered INT NOT NULL CHECK (recovered >= 0)
);
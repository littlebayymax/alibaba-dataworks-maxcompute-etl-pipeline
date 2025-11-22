-- Hologres Table: Daily Banking Transaction KPIs
-- Purpose: Real-time query for daily transaction analytics

CREATE TABLE IF NOT EXISTS hologres_daily_transactions (
    dt DATE COMMENT 'Transaction date',
    account_type STRING COMMENT 'Type of account: Savings, Checking, etc.',
    region STRING COMMENT 'Region where transactions occurred',
    total_amount DOUBLE COMMENT 'Total transaction amount per day',
    active_users BIGINT COMMENT 'Number of unique active accounts per day'
)
DISTRIBUTED BY HASH(account_type)  -- Ensures even distribution for faster queries
;

-- Load daily aggregated data from DWS
-- Replace with MaxCompute-to-Hologres sync process
INSERT INTO hologres_daily_transactions (dt, account_type, region, total_amount, active_users)
SELECT dt, account_type, region, total_amount, active_users
FROM dws_transaction_fact
WHERE dt = '2025-11-22';

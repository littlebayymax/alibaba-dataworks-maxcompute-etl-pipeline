CREATE TABLE IF NOT EXISTS dws_transaction_fact (
    account_type STRING COMMENT 'Type of account: Savings, Checking, etc.',
    region STRING COMMENT 'Region where transactions occurred',
    total_amount DOUBLE COMMENT 'Total transaction amount per day',
    active_users BIGINT COMMENT 'Number of unique active accounts per day'
)
PARTITIONED BY (dt STRING COMMENT 'Transaction date in yyyy-MM-dd format')
COMMENT 'Daily aggregated transaction KPIs (DWS layer)'
LIFECYCLE 180;

-- Insert aggregated data into DWS table
INSERT OVERWRITE TABLE dws_transaction_fact PARTITION(dt)
SELECT
    account_type,
    region,
    SUM(transaction_amount) AS total_amount,
    COUNT(DISTINCT account_id) AS active_users,
    dt
FROM dwd_transactions_clean
WHERE dt = '2025-11-22'
GROUP BY account_type, region, dt;

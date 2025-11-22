CREATE TABLE IF NOT EXISTS ods_transactions (
    transaction_id STRING COMMENT 'Unique transaction ID',
    account_id STRING COMMENT 'Account ID of the customer',
    account_type STRING COMMENT 'Type of account: Savings, Checking, etc.',
    transaction_amount DOUBLE COMMENT 'Amount of the transaction',
    transaction_type STRING COMMENT 'Transaction type: Deposit, Withdrawal, Transfer',
    transaction_time STRING COMMENT 'Timestamp of the transaction',
    region STRING COMMENT 'Region where the transaction occurred'
)
PARTITIONED BY (dt STRING COMMENT 'Transaction date in yyyy-MM-dd format')
COMMENT 'Raw banking transactions table (ODS layer)'
LIFECYCLE 30;

-- Load data into a specific partition
-- Assume the CSV has been uploaded to OSS (Object Storage Service)
-- Replace 'oss://your-bucket/transactions.csv' with actual path
INSERT INTO ods_transactions PARTITION(dt='2025-11-22')
SELECT
    transaction_id,
    account_id,
    account_type,
    transaction_amount,
    transaction_type,
    transaction_time,
    region
FROM ods_transactions_staging
WHERE SUBSTR(transaction_time, 1, 10) = '2025-11-22';

CREATE TABLE IF NOT EXISTS dwd_transactions_clean (
    transaction_id STRING COMMENT 'Unique transaction ID',
    account_id STRING COMMENT 'Account ID of the customer',
    account_type STRING COMMENT 'Type of account: Savings, Checking, etc.',
    transaction_amount DOUBLE COMMENT 'Amount of the transaction',
    transaction_type STRING COMMENT 'Transaction type: Deposit, Withdrawal, Transfer',
    transaction_time TIMESTAMP COMMENT 'Standardized timestamp of the transaction',
    region STRING COMMENT 'Region where the transaction occurred'
)
PARTITIONED BY (dt STRING COMMENT 'Transaction date in yyyy-MM-dd format')
COMMENT 'Cleaned banking transactions table (DWD layer)'
LIFECYCLE 90;

-- Insert data into DWD table with partitioning
INSERT OVERWRITE TABLE dwd_transactions_clean PARTITION(dt)
SELECT
    transaction_id,
    account_id,
    account_type,
    transaction_amount,
    transaction_type,
    TO_TIMESTAMP(transaction_time, 'yyyy-MM-dd HH:mm:ss') AS transaction_time,
    region,
    SUBSTR(transaction_time, 1, 10) AS dt
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY transaction_time DESC) AS rn -- deduplicate
    FROM ods_transactions
    WHERE dt = '2025-11-22'
) t
WHERE rn = 1
  AND transaction_id IS NOT NULL
  AND account_id IS NOT NULL
  AND transaction_amount IS NOT NULL
  AND transaction_type IS NOT NULL;

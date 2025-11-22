CREATE TABLE IF NOT EXISTS ods_transactions (
  transaction_id STRING,
  order_id STRING,
  payment_method STRING,
  amount DOUBLE,
  payment_time STRING,
  ingestion_time TIMESTAMP
)
PARTITIONED BY (dt STRING)
LIFECYCLE 30;

INSERT OVERWRITE TABLE ods_transactions PARTITION (dt = '${bizdate}')
SELECT
  transaction_id STRING,
  order_id STRING,
  payment_method STRING,
  amount DOUBLE,
  payment_time STRING,
  CURRENT_TIMESTAMP() AS ingestion_time
FROM oss_transactions_raw;

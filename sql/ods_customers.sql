CREATE TABLE IF NOT EXISTS ods_customers (
  customer_id STRING,
  name STRING,
  email STRING,
  country STRING,
  signup_date STRING,
  ingestion_time TIMESTAMP
)
PARTITIONED BY (dt STRING)
LIFECYCLE 30;

INSERT OVERWRITE TABLE ods_customers PARTITION (dt = '${bizdate}')
SELECT
  customer_id STRING,
  name STRING,
  email STRING,
  country STRING,
  signup_date STRING,
  CURRENT_TIMESTAMP() AS ingestion_time
FROM oss_customers_raw;
  

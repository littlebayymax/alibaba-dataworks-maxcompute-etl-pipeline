-- ODS Layer: Clean & standardize raw order data
CREATE TABLE IF NOT EXISTS ods_orders (
  order_id STRING,
  customer_id STRING,
  product_id STRING,
  order_date STRING,
  order_amount DOUBLE,
  order_status STRING,
  ingestion_time TIMESTAMP
)
PARTITIONED BY (dt STRING)
LIFECYCLE 30;

INSERT OVERWRITE TABLE ods_orders PARTITION (dt = '${bizdate}')
SELECT
  order_id STRING,
  customer_id STRING,
  product_id STRING,
  order_date STRING,
  order_amount DOUBLE,
  order_status STRING,
  CURRENT_TIMESTAMP() AS ingestion_time
FROM oss_orders_raw;

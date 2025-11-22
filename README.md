# alibaba-dataworks-maxcompute-etl-pipeline
End-to-end cloud ETL project using Alibaba Cloud OSS, DataWorks, MaxCompute, and Hologres.

## Cloud ETL Pipeline (Alibaba Cloud)
This project demonstrates an end-to-end Cloud ETL pipeline built on Alibaba Cloud OSS, DataWorks, MaxCompute, and Hologres.  
It simulates a real data engineering workflow used in production environments.

## Architecture Overview
Data Source → OSS → MaxCompute ODS → MaxCompute DWD → MaxCompute DWS → Hologres  

This pipeline includes:  
- Batch ingestion from OSS  
- Scheduled workflows via DataWorks  
- MaxCompute SQL transformation (ODS → DWD → DWS)  
- Real-time serving using Hologres

---
  
### Project Structure
| Folder / File   | Description                                           |
|-----------------|-------------------------------------------------------|
| `data/`         | Sample raw CSV files for testing the ETL pipeline    |
| `sql/`          | MaxCompute SQL scripts (ODS, DWD, DWS)              |
| `dataworks/`    | DataWorks workflow definitions and JSON exports     |
| `images/`       | Architecture diagrams and visuals                   |
| `README.md`     | Project documentation                                |


---

### Data Flow Explanation
1. **Raw Data (OSS)**  
   Raw files such as:  
   - orders.csv  
   - customers.csv  
   - transactions.csv  
   Stored under: `oss://project-bucket/raw/orders/`

2. **ODS Layer (Operational Data Store)**  
   Example:
   ```sql
   CREATE TABLE ods_orders (
       order_id STRING,
       customer_id STRING,
       amount DOUBLE,
       created_at DATETIME
   );

3. **DWD Layer (Data Warehouse Detail)**
   Example:
   ```sql
   CREATE TABLE dwd_orders AS
   		SELECT
   			order_id,
   			customer_id,
   			amount,
   			DATE(created_at) AS order_date
   		FROM ods_orders;

4. **DWS Layer (Data Warehouse Summary)**
   Example:
   ```sql
   CREATE TABLE dws_daily_gmv AS
   		SELECT
   			order_date,
   			SUM(amount) AS gmv
   		FROM dwd_orders
   		GROUP BY order_date;

---

### Technologies Used
- OSS - raw file storage
- DataWorks - workflow orchestration and scheduling
- MaxCompute - data warehouse + SQL transformation
- Hologres - real-time analytics serving

---

### DataWorks Workflow
Included components:
- ODPS SQL nodes
- Resource node (OSS → MaxCompute)
- Scheduled daily at 2:00 AM
- Dependencies: ODS → DWD → DWS → Sync to Hologres

---

### How to Run
1.	Upload data/*.csv to OSS
2.	Create ODS tables in MaxCompute
3.	Create DWD & DWS transformations
4.	Import workflow to DataWorks
5.	Enable scheduling
6.	Sync results to Hologres

---

## Why This Project Matters 
- Real data engineering architecture
- Cloud environment usage
- End-to-end pipeline thinking
- Strong SQL & ETL capability

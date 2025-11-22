# alibaba-dataworks-maxcompute-etl-pipeline
End-to-end cloud ETL project using Alibaba Cloud OSS, DataWorks, MaxCompute, and Hologres.

## Project Overview - Banking Transaction Analytics Pipeline
This project demonstrates a complete banking transaction data pipeline using MaxCompute, DataWorks, and Hologres. The pipeline processes raw transaction data, performs data cleaning and transformation, builds a structured data warehouse, and generates real-time KPIs for analysis. It is designed to showcase production-ready data engineering skills suitable for Singapore’s financial industry.

--- 

### Key Objectives:
1. Process raw banking transactions (ODS layer).
2. Clean and standardize data (DWD layer).
3. Build fact tables and dimension tables for analysis (DWS layer).
4. Support real-time analytics with Hologres.
5. Automate ETL workflows using DataWorks.

---

## Tech Stack
- Data Storage & Processing: MaxCompute (ODS/DWD/DWS)
- Real-Time Analytics: Hologres
- ETL Orchestration: DataWorks DAG
- SQL & Partitioning: MaxCompute SQL, partitioned by transaction date (dt)
- Visualization: Jupyter Notebook with SQL analysis or optional Tableau / Superset

---

## Data Source
Simulated banking transactions including:
- transaction_id, account_id, account_type, transaction_amount
- transaction_type, transaction_time, region

---
  
### Project Structure
| Folder / File         | Description                                           |
|-----------------------|-------------------------------------------------------|
| `raw_data/`           | transactions.csv # raw transaction data               |
| `dataworks_projects/` | MaxCompute SQL scripts (ODS, DWD, DWS)                |
| `hologres/`           | hologres_daily_transactions.sql                       |
| `notebooks/`          | transaction_kpi_analysis.ipynb                        |
| `README.md`           | Project documentation                                 |

---

### Data Pipeline Overview
1. **ODS (Raw Data Layer)**  
   - Store raw transactions uploaded from CSV or external sources.
   - Partitioned by dt (transaction date)

3. **DWD (Cleaned Data Layer)**  
   - Remove duplicates and handle null/invalid values.
   - Standardize timestamps and account types.
   - Partitioned by dt.

4. **DWS (Data Warehouse Layer)**
   - Build transaction fact tables and user dimension tables.
   - Aggregate daily KPIs (total transaction amount, active users) by account type and region.
   - Partitioned by dt.
  
5. **Hologres (Real-Time Analysis)**
   - Enable quick KPI queries and dashboards.
   - Support daily monitoring and reporting.
   
---

### Key Features
- Partitioning: Efficient queries on large transaction datasets.
- Scalable SQL ETL: ODS → DWD → DWS using MaxCompute SQL.
- Real-Time Analytics: Hologres tables for fast KPI queries.
- Automation: DataWorks DAG to schedule and orchestrate ETL jobs.
- Extensible: Can add new KPIs or dimensions without changing the pipeline.
  
---

### How to Run
1.	Upload raw CSV data to MaxCompute ODS table.
2.	Execute ETL SQL scripts in DataWorks (ODS → DWD → DWS).
3.	Sync DWS tables to Hologres for real-time analysis.
4.	Use Jupyter Notebook or BI tools to query KPIs.
   

# Banking Transaction Analytics Pipeline

## Project Overview 
This project demonstrates a complete banking transaction data pipeline using MaxCompute, DataWorks, and Hologres. The pipeline processes raw transaction data, performs cleaning and transformation, builds a structured data warehouse, and generates real-time KPIs for analysis. 

### Key Objectives:
- Process raw banking transactions (ODS layer)
- Clean and standardize data (DWD layer)
- Build fact tables and dimension tables for analysis (DWS layer)
- Enable real-time analytics with Hologres
- Automate ETL workflows using DataWorks

## Tech Stack
- Data Storage & Processing: MaxCompute (ODS/DWD/DWS)
- Real-Time Analytics: Hologres
- ETL Orchestration: DataWorks DAG
- SQL & Partitioning: MaxCompute SQL, partitioned by transaction date (dt)
- Visualization: Jupyter Notebook with pandas/matplotli

## Data Source
Simulated banking transactions including:
- transaction_id, account_id, account_type, transaction_amount
- transaction_type, transaction_time, region

---

## Project Structure
| Folder / File         | Description                                           |
|-----------------------|-------------------------------------------------------|
| `raw_data/`           | sample raw transaction data                           |
| `dataworks_projects/` | MaxCompute SQL scripts (ODS, DWD, DWS)                |
| `hologres/`           | hologres_daily_transactions.sql                       |
| `notebooks/`          | transaction_kpi_analysis.ipynb                        |
| `README.md`           | Project documentation                                 |

---

## Data Pipeline Overview
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

### Why This Project Stands Out
- Production-ready data engineering workflow (ODS → DWD → DWS → Hologres)
- Partitioned tables for scalable analytics
- Real-time KPI analysis using Hologres
- ETL automation with DataWorks
- Sample data simulates realistic banking transactions
- Ready for BI tools / dashboards (Tableau, Superset, or Python)

### How to Run
1.	Upload raw CSV data to MaxCompute ODS table.
2.	Execute ETL SQL scripts in DataWorks (ODS → DWD → DWS).
3.	Sync DWS tables to Hologres for real-time analysis.
4.	Open notebooks/transaction_kpi_analysis.ipynb to run KPI queries and generate plots.
   

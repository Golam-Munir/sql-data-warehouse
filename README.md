# SQL Data Warehouse Project 🏗️

Welcome to my SQL Data Warehouse project — a end-to-end data engineering portfolio project built with SQL Server, following **Medallion Architecture** (Bronze, Silver, Gold). This project demonstrates real-world data engineering skills including ETL pipeline development, data modelling, and analytical reporting.

---

## 🏛️ Data Architecture

This project follows the **Medallion Architecture** with three distinct layers:

| Layer | Purpose |
|---|---|
| 🥉 **Bronze** | Raw data ingested as-is from CSV source files into SQL Server |
| 🥈 **Silver** | Cleaned, standardised, and normalised data ready for integration |
| 🥇 **Gold** | Business-ready star schema optimised for reporting and analytics |

---

## 📖 Project Overview

This project covers the full data engineering lifecycle:

- **Data Architecture** — Designing a modern data warehouse using Medallion Architecture
- **ETL Pipelines** — Extracting, transforming, and loading data from two source systems (CRM and ERP)
- **Data Quality** — Identifying and resolving real data quality issues including duplicates, nulls, encoding errors, and invalid values
- **Data Modelling** — Building a star schema with fact and dimension tables for analytical queries
- **Analytics** — Writing SQL-based reports for customer behaviour, product performance, and sales trends <br><br>
  
<img width="1073" height="752" alt="Data_Architecture" src="https://github.com/user-attachments/assets/40e19006-2b4e-4871-9272-1695f18d3f98" />

---

## 🎯 Skills Demonstrated

This project is relevant for the following roles:

- Data Engineer
- SQL Developer
- ETL Pipeline Developer
- Data Architect
- Analytics Engineer

---

## 🗂️ Repository Structure

```
sql-data-warehouse/
│
├── datasets/                    # Raw CSV files from CRM and ERP source systems
│   ├── source_crm/              # CRM source files
│   └── source_erp/              # ERP source files
│
├── docs/                        # Project documentation and diagrams
│   ├── data_architecture.drawio # Architecture diagram
│   ├── data_flow.drawio         # Data flow and lineage diagram
│   ├── data_integration.drawio  # Source system integration model
│   ├── data_models.drawio       # Star schema data model
│   └── data_catalog.md          # Column descriptions and business definitions
│
├── scripts/                     # SQL scripts for all layers
│   ├── init/                    # Database and schema initialisation
│   ├── bronze/                  # Raw data ingestion scripts
│   │   ├── ddl_bronze.sql       # Bronze table definitions
│   │   └── proc_load_bronze.sql # Bronze load stored procedure
│   ├── silver/                  # Transformation and cleansing scripts
│   │   ├── ddl_silver.sql       # Silver table definitions
│   │   └── proc_load_silver.sql # Silver load stored procedure
│   └── gold/                    # Analytical layer scripts
│       └── ddl_gold.sql         # Gold views (star schema)
│
├── tests/                       # Data quality validation scripts
├── README.md                    # Project overview
├── LICENSE                      # MIT License
└── .gitignore                   # Git ignore rules
```

---

## 🛠️ Tools and Technologies

| Tool | Purpose |
|---|---|
| **SQL Server 2022** | Database engine (via Docker) |
| **TablePlus** | GUI for querying and exploring data |
| **Git and GitHub** | Version control and portfolio hosting |
| **Draw.io** | Architecture and data flow diagrams |
| **Docker** | Local SQL Server environment on Mac |

---

## 🚀 How To Run This Project

### Prerequisites
- Docker installed and running
- TablePlus or any SQL Server compatible client
- Git

### Steps

**1. Start SQL Server via Docker:**
```bash
docker run --platform linux/amd64 \
  -e ACCEPT_EULA=Y \
  -e MSSQL_SA_PASSWORD=YourPassword \
  -p 1433:1433 \
  --name sqlserver_dw \
  -d mcr.microsoft.com/mssql/server:2022-latest
```

**2. Initialise the database:**
```sql
-- Run scripts/init/init_database.sql
```

**3. Load the Bronze layer:**
```sql
EXEC bronze.load_bronze;
```

**4. Load the Silver layer:**
```sql
EXEC silver.load_silver;
```

**5. Build the Gold layer:**
```sql
-- Run scripts/gold/ddl_gold.sql
```

---

## 📊 Data Model

The Gold layer follows a **Star Schema** with:

- `gold.dim_customers` — Customer demographics and location
- `gold.dim_products` — Product details, categories, and pricing
- `gold.fact_sales` — Transactional sales records linked to dimensions <br><br>
  
<img width="1001" height="641" alt="Data Mart (Star Schema)" src="https://github.com/user-attachments/assets/06933385-a97d-4de6-a7ba-255e205cdb72" />

---

## 📬 About Me

Hi, I am **Golam Munir** — a Melbourne-based professional transitioning into Data Engineering. I bring a background in ICT operations, process improvement, and a strong passion for building data systems that deliver real business value.

This project is part of my ongoing portfolio as I work toward a professional Data Engineering role in Australia.

- 🐙 GitHub: [github.com/Golam-Munir](https://github.com/Golam-Munir)
- 📧 Email: golam.mt.munir@gmail.com
- 📍 Melbourne, VIC, Australia

---

## 🛡️ License

This project is licensed under the MIT License. Feel free to use, modify, and share with proper attribution.

---

> *"Data engineering is not just about moving data — it is about building systems that people can trust."*

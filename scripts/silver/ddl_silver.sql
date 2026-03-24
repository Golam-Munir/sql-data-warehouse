/*
=============================================================
Script by Golam : ddl_silver.sql
Layer   : silver
Purpose : Ingestion tables in the silver schema after data cleaning, standardization, normalization and enrichment.
Warning : Running this script drops and recreates all silver tables.
=============================================================
*/

-- ============================================================
-- CRM Source System Tables
-- ============================================================

IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info;

GO

CREATE TABLE silver.crm_cust_info
(
    cst_id              INT,
    cst_key             NVARCHAR(50),  -- AW00011000 is text, not a number
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),   -- source stores M/F single character
    cst_create_date     DATE,
    dwh_create_date DATETIME2 DEFAULT getdate()
);

GO

IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info;

GO

CREATE TABLE silver.crm_prd_info
(
    prd_id          INT,
    cat_id  		NVARCHAR(50), -- New row in silver layer
    prd_key         NVARCHAR(50),  -- CO-RF-FR-R92B-58 is text, not a number
    prd_nm          NVARCHAR(50),
    prd_cost        DECIMAL(10,2), -- can be null, may have decimals
    prd_line        NVARCHAR(50),
    prd_start_dt    DATE,
    prd_end_dt      DATE,
    dwh_create_date DATETIME2 DEFAULT getdate()
);

GO

IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;

GO

CREATE TABLE silver.crm_sales_details
(
    sls_ord_num     NVARCHAR(50),
    sls_prd_key     NVARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    DATE,   -- stored as 20101229 in source, converted in Silver
    sls_ship_dt     DATE,   -- stored as 20110105 in source, converted in Silver
    sls_due_dt      DATE,   -- stored as 20110110 in source, converted in Silver
    sls_sales       INT,
    sls_quantity    INT,
    sls_price       INT,
    dwh_create_date DATETIME2 DEFAULT getdate()
);

GO

-- ============================================================
-- ERP Source System Tables
-- ============================================================

IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;

GO

CREATE TABLE silver.erp_cust_az12
(
    cid     NVARCHAR(50),
    bdate   DATE,
    gen     NVARCHAR(50),   -- Male/Female is longer than 1 character
    dwh_create_date DATETIME2 DEFAULT getdate()

);

GO 

IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;

GO

CREATE TABLE silver.erp_loc_a101
(
    cid     NVARCHAR(50),
    cntry   NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT getdate()
);

GO 

IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;

GO

CREATE TABLE silver.erp_px_cat_g1v2
(
    id          NVARCHAR(50),  -- AC_BR is text, not a number
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT getdate()
);

GO

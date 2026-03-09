/*
=============================================================
Script by Golam : ddl_bronze.sql
Layer   : Bronze
Purpose : Creates all raw ingestion tables in the bronze schema.
          Bronze stores data exactly as-is from source systems.
          No transformation. No cleansing.
Warning : Running this script drops and recreates all bronze tables.
=============================================================
*/

-- ============================================================
-- CRM Source System Tables
-- ============================================================

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info
(
    cst_id              INT,
    cst_key             NVARCHAR(50),  -- AW00011000 is text, not a number
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(1),
    cst_gndr            NVARCHAR(1),   -- source stores M/F single character
    cst_create_date     DATE
);

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info
(
    prd_id          INT,
    prd_key         NVARCHAR(50),  -- CO-RF-FR-R92B-58 is text, not a number
    prd_nm          NVARCHAR(50),
    prd_cost        DECIMAL(10,2), -- can be null, may have decimals
    prd_line        NVARCHAR(50),
    prd_start_dt    DATE,
    prd_end_dt      DATE
);

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num     NVARCHAR(50),
    sls_prd_key     NVARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    INT,   -- stored as 20101229 in source, convert in Silver
    sls_ship_dt     INT,   -- stored as 20110105 in source, convert in Silver
    sls_due_dt      INT,   -- stored as 20110110 in source, convert in Silver
    sls_sales       INT,
    sls_quantity    INT,
    sls_price       INT
);

-- ============================================================
-- ERP Source System Tables
-- ============================================================

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12
(
    cid     NVARCHAR(50),
    bdate   DATE,
    gen     NVARCHAR(50)   -- Male/Female is longer than 1 character
);

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101
(
    cid     NVARCHAR(50),
    cntry   NVARCHAR(50)
);

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2
(
    id          NVARCHAR(50),  -- AC_BR is text, not a number
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50)
);
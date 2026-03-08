/*
=============================================================
Script by Golam: init_database.sql
Purpose: Creates the DataWarehouse database from scratch.
         If the database already exists, it drops and recreates it.
         Creates three schemas: bronze, silver, gold.

WARNING: Running this script will DESTROY the existing 
         DataWarehouse database and ALL data inside it.
         Only run this during initial setup.
=============================================================
*/

-- Step 1: Switch to master database
USE master;
GO

-- Step 2: Drop and recreate the DataWarehouse database
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

CREATE DATABASE DataWarehouse;
GO

-- Step 3: Switch to the new database
USE DataWarehouse;
GO

-- Step 4: Create the three layer schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

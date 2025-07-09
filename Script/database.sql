/*
This script creates a new SQL Server database called DataWarehouse. Here's what it does step by step:
Checks if the DataWarehouse database already exists.
If it does exist, the script drops it completely — which means all existing data and objects in the database will be
permanently deleted.
After dropping (or if it didn’t exist to begin with), it creates a fresh DataWarehouse database.
Inside this database, it creates three schemas commonly used in data warehousing:
bronze – for raw/staging data
silver – for cleaned and transformed data
gold – for analytics-ready, curated data	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE dataWarehouse;
GO

USE datawarehouse;
GO

-- Create Schemas
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO

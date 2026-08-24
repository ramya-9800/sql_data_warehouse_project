/*
CREATE DATABASES:

Script purpose:
    This script creates a new database named "Data warehouse".
    Additionally, the script sets up three schemas(databases) within the database: bronze, silver, gold.
*/

create  database dataWarehouse;
use datawarehouse;
create database bonze_db;
create database silver_db;
create database gold_db;

/*
Create Database and Schemas

Script purpose:
    This script creates a new database named "Data warehouse".
    Additionally, the script sets up three schemas within the database: bronze, silver, gold.
*/

create  database dataWarehouse;
use datawarehouse;
create schema bronze;
create schema silver;
create schema gold;

/*

CREATE DATABASE AND SCHEMAS

Script Purpose:
This script creates a new database named data_ware_house after checking if it already exists.
If the database exists, it is dropped and recreated.
also create bronze_db, silver_db, gold_db databases for maintaining layers.

WARNING:
Running this script will drop the entire 'DataWareHouse' database if it exists.
All the data in the database will be permanently deleted.
Proceed with caution. 
and ensure you have proper backups before running this script.

*/

-- Drop the database if it exists
DROP DATABASE IF EXISTS data_ware_house;

-- Recreate the database
CREATE DATABASE data_ware_house;

use data_ware_house;

-- create other dbs for maintaining layers
create database bronze_db;
create database silver_db;
create database gold_db;


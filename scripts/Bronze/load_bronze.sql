/*
===============================================
in this layer we are loading the data which is stored inside csv files into our bronze layer tables. 
===============================================
*/


/*
--it is used to check which folder MySQL allows the server to access when importing or exporting files.
SHOW VARIABLES LIKE 'secure_file_priv';


-- To enable loading data from local files into MySQL using LOAD DATA LOCAL INFILE.
SET GLOBAL local_infile = 1; 

-- To check whether local file loading is enabled or disabled on the MySQL server.
SHOW GLOBAL VARIABLES LIKE 'local_infile';


OPT_LOCAL_INFILE=1
Location: Home → Right-click MySQL Connection → Edit Connection → Advanced → Others

Setting added:
OPT_LOCAL_INFILE=1

Purpose: 
To allow the MySQL Workbench client to request loading data from local files using LOAD DATA LOCAL INFILE.


-- but im not importing from local path im importing  from a sql restricted path
*/



SHOW VARIABLES LIKE 'secure_file_priv';



-- Removes all existing rows from the table while keeping the table structure unchanged.
-- Imports data from a local CSV file into the MySQL table.
TRUNCATE TABLE crm_cust_info;
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_info.csv'
INTO TABLE bronze_db.crm_cust_info
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cst_id, cst_key, cst_firstname, cst_lastname,
 cst_marital_status, cst_gndr, @cst_create_date)
SET
    cst_id = NULLIF(@cst_id, ''),
    cst_create_date = NULLIF(@cst_create_date, '');

-- select * from crm_cust_info;




-- Removes all existing rows from the table while keeping the table structure unchanged.
-- Imports data from a local CSV file into the MySQL table.
TRUNCATE TABLE bronze_db.crm_prd_info;
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/prd_info.csv'
INTO TABLE bronze_db.crm_prd_info
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(prd_id, prd_key, prd_nm, @prd_cost,
 prd_line, @prd_start_dt, @prd_end_dt)
SET
    prd_cost = NULLIF(@prd_cost, ''),
    prd_start_dt = NULLIF(@prd_start_dt, ''),
    prd_end_dt = NULLIF(@prd_end_dt, '');

-- select * from crm_prd_info;





-- Removes all existing rows from the table while keeping the table structure unchanged.
-- Imports data from a local CSV file into the MySQL table.
TRUNCATE TABLE crm_sales_details;
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_details.csv'
INTO TABLE bronze_db.crm_sales_details
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(sls_ord_num, sls_prd_key, sls_cust_id,
 @sls_order_dt, @sls_ship_dt, @sls_due_dt,
 @sls_sales, sls_quantity, @sls_price)
SET
    sls_order_dt = NULLIF(@sls_order_dt, ''),
    sls_ship_dt  = NULLIF(@sls_ship_dt, ''),
    sls_due_dt   = NULLIF(@sls_due_dt, ''),
    sls_sales    = NULLIF(@sls_sales, ''),
    sls_price    = NULLIF(@sls_price, '');

-- select * from crm_sales_details;




-- Removes all existing rows from the table while keeping the table structure unchanged.
-- Imports data from a local CSV file into the MySQL table.
TRUNCATE TABLE erp_loc_a101;
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/LOC_A101.csv'
INTO TABLE bronze_db.erp_loc_a101
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;






-- Removes all existing rows from the table while keeping the table structure unchanged.
-- Imports data from a local CSV file into the MySQL table.
TRUNCATE TABLE erp_cust_az12;
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CUST_AZ12.csv'
INTO TABLE bronze_db.erp_cust_az12
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cid, @bdate, @gen)
SET
    cid = NULLIF(@cid, ''),
    bdate = NULLIF(@bdate, ''),
    gen = NULLIF(@gen, '');

-- select * from erp_cust_az12;






-- Removes all existing rows from the table while keeping the table structure unchanged.
-- Imports data from a local CSV file into the MySQL table.
TRUNCATE TABLE erp_px_cat_g1v2;
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PX_CAT_G1V2.csv'
INTO TABLE bronze_db.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- select * from erp_px_cat_g1v2;




/*
I used NULLIF() for the integer and date columns 
because the source CSV contains some blank values.
 MySQL does not accept an empty string ('') as a valid integer or date value. 
 So I converted the blank values to NULL during the data loading process.
 This prevents data type errors and represents missing values correctly.
*/

/*
creating stored procedures
save frequently used SQL code in stored procedures in database

SYNTAX:  DROP--> DELIMETER-->CREATE PROCEDURE-->BEGIN/END-->DELIMITER back-->CALL
*/

/*
: In SQL Server,BULK INSERT can be used inside a stored procedure to automate Bronze-layer loading. 
 In MySQL, LOAD DATA INFILE cannot be used inside stored procedures.
 Therefore, I loaded the source CSV files directly using LOAD DATA INFILE and verified the loaded row counts.
*/

select * from crm_cust_info;
select * from crm_prd_info;
select * from crm_sales_details;

select * from erp_cust_az12;
select * from erp_loc_a101;
select * from erp_px_cat_g1v2;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_info.csv'
INTO TABLE crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cst_id, cst_key, cst_firstname, cst_lastname, cst_material_status, cst_gndr, @cst_create_date)
SET cst_id = NULLIF(@cst_id, ''),
cst_create_date=NULLIF(@cst_create_date,'');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/prd_info.csv'
INTO TABLE crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@prd_id, prd_key, prd_nm, @prd_cost,prd_line, @prd_start_dt, @prd_end_dt)
SET prd_id = NULLIF(@prd_id, ''),
prd_cost=NULLIF(@prd_cost,''),
prd_start_dt=NULLIF(@prd_start_dt,''),
prd_end_dt=NULLIF(@prd_end_dt,'');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_details.csv'
INTO TABLE crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(sls_ord_num,sls_prd_key,@sls_cust_id,@sls_order_dt,@sls_ship_dt,@sls_due_dt,@sls_sales,@sls_quantity,@sls_price)
SET sls_cust_id = NULLIF(@sls_cust_id, ''),
sls_order_dt=NULLIF(@sls_order_dt,''),
sls_ship_dt=NULLIF(@sls_due_dt,''),
sls_sales=NULLIF(@sls_sales,''),
sls_price=NULLIF(@sls_price,'');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CUST_AZ12.csv'
INTO TABLE erp_cust_az12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(cid,@bdate,@gen)
SET bdate = NULLIF(@bdate, ''),
gen=NULLIF(@gen,'');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/LOC_A101.csv'
INTO TABLE erp_loc_a101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PX_CAT_G1V2.csv'
INTO TABLE erp_px_cat_g1v2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



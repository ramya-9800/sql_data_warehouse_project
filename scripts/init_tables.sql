/*
used a bronze_db as per our first layer,
created tables with the same columns that we contain in our source system files
3 tables from crm (cust_info,prd_info,sales_details)
3 tables from erp (loc_a101,cust_az12,px_cat_g1v2)
naming convention followed ---> crm_cust_info, crm_prd_info etc
 */

use bronze_db;
create table bronze_db.crm_cust_info(
cst_id int,
cst_key varchar(50),
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_material_status varchar(50),
cst_gndr varchar(50),
cst_create_date date
);

create table bronze_db.crm_prd_info(
prd_id int,
prd_key varchar(50),
prd_nm varchar(50),
prd_cost int,
prd_line varchar(50),
prd_start_dt datetime,
prd_end_dt datetime);

create table bronze_db.crm_sales_details(
sls_ord_num varchar(50),
sls_prd_key varchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);

create table bronze_db.erp_loc_a101(
cid varchar(50),
cntry varchar(50)
);

create table bronze_db.erp_cust_az12(
cid varchar(50),
bdate date,
gen varchar(50)
);

create table bronze_db.erp_px_cat_g1v2(
id varchar(50),
cat varchar(50),
subcat varchar(50),
maintenance varchar(50)
);

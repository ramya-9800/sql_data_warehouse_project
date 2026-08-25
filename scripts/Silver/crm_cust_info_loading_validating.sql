/* row_number() --> 
assigns unique number to each row in a result set, bsased on a defined order.
why we are using this is: we have duplicates in primary key column(cst_id) in crm_cust_info table 
to pick one among them we are giving ranking to them. 
we can pick the higher ranking key which is the latest(considered by cst_create_date column) among others.
*/

use silver_db;
select * from silver_db.crm_cust_info;
select count(*) from silver_db.crm_cust_info;

/*
inserting cleaned data into silver_db from bronze_db 
*/
insert into silver_db.crm_cust_info(
cst_id,
cst_key,
cst_firstname,
cst_lastname,
cst_material_status,
cst_gndr,
cst_create_date
)
select
cst_id,
cst_key,
trim(cst_firstname) as cst_first_name,
trim(cst_lastname)as cst_last_name,
case when upper(trim(cst_material_status))='S' then 'Single'
	 when upper(trim(cst_material_status))='M' then 'Married'
     else 'n/a'
end cst_material_status,
case when upper(trim(cst_gndr)) = 'F' then 'Female'
     when upper(trim(cst_gndr)) = 'M' then 'Male'
     else 'n/a'
end cst_gndr,
cst_create_date
from(
select *,
row_number() over(partition by cst_id order by cst_create_date desc) as flag_last
from bronze_db.crm_cust_info
where cst_id is not null
) t 
where flag_last=1;


/* VALIDATION */
/* check for NULLs or Duplicates in primary key */
/* expectation: no result */
select cst_id, count(*)
from silver_db.crm_cust_info
group by cst_id
having count(*)>1 or cst_id is null;


/*check for unwantrerd spaces*/
/*expectation: no results*/
select cst_key
from silver_db.crm_cust_info
where cst_key!=trim(cst_key);

select cst_firstname
from silver_db.crm_cust_info
where cst_firstname!=trim(cst_firstname);

select cst_lastname
from silver_db.crm_cust_info
where cst_lastname!=trim(cst_lastname);

select cst_gndr
from silver_db.crm_cust_info
where cst_gndr!=trim(cst_gndr);


/* data standardization & consistency*/
/* checking unique values in cst_gndr colum of crm_cust_info table*/
/*F,M,(null)*/
select distinct cst_gndr
from crm_cust_info;

/* checking unique values in cst_material_status colum of crm_cust_info table*/
/*S,M,(null)*/
select distinct cst_material_status
from crm_cust_info;

select * from silver_db.crm_cust_info;

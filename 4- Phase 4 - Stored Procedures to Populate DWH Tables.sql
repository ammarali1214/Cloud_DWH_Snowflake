-- POPULATING DWH TABLES
-- SNOWFLAKE STORED PROCEDURES TO POPULATE DWH-TABLES

-- FOR D_CUSTOMER TABLE
CREATE OR REPLACE PROCEDURE insert_d_customer()
RETURNS VARCHAR
LANGUAGE JAVASCRIPT
AS
$$
var sql_command = "INSERT INTO D_CUSTOMER (customer_id, customer_name, customer_zip_cd) SELECT customer_id, customer_name, zip_code FROM online_store_raw.online_store_raw.customers";
var stmt = snowflake.createStatement({sqlText: sql_command});
stmt.execute();
return "Values inserted successfully!";
$$;

-- FOR D_PRODUCT TABLE
CREATE OR REPLACE PROCEDURE insert_D_PRODUCT()
RETURNS VARCHAR
LANGUAGE JAVASCRIPT
AS
$$
var sql_command = "insert into D_PRODUCT (PRODUCT_ID, CATEGORY_ID, PRODUCT_NAME) select PRODUCT_ID, CATEGORY_ID, PRODUCT_NAME from ONLINE_STORE_RAW.ONLINE_STORE_RAW.PRODUCTS";
var stmt = snowflake.createStatement({sqlText: sql_command});
stmt.execute();
return "Values inserted successfully!";
$$;

-- FOR D_ PRODUCT_CATEGORY TABLE
CREATE OR REPLACE PROCEDURE insert_D_PRODUCT_CATEGORY()
RETURNS VARCHAR
LANGUAGE JAVASCRIPT
AS
$$
var sql_command = "INSERT INTO D_PRODUCT_CATEGORY (CATEGORY_ID, CATEGORY_NAME) SELECT CATEGORY_ID, CATEGORY_NAME from ONLINE_STORE_RAW.ONLINE_STORE_RAW.PROD_CATEGORY";
var stmt = snowflake.createStatement({sqlText: sql_command});
stmt.execute();
return "Values inserted successfully!";
$$;


-- FOR F_ORDERS TABLE
CREATE OR REPLACE PROCEDURE insert_ F_ORDERS()
RETURNS VARCHAR
LANGUAGE JAVASCRIPT
AS
$$
var sql_command = "INSERT INTO F_ORDERS (ORDER_ID, CUSTOMER_ID, PRODUCT_ID, UNIT_PRICE, QUANTITY, DISCOUNT, TOTAL_PRICE, ORDER_DATE) SELECT O.ORDER_ID, C.CUSTOMER_ID, O.PRODUCT_ID, O.UNIT_PRICE, O.QUANTITY, O.DISCOUNT, O.TOTAL_PRICE, C.ORDER_DATE FROM ONLINE_STORE_RAW.ONLINE_STORE_RAW.ORDER_DETAILS O LEFT JOIN ONLINE_STORE_RAW.ONLINE_STORE_RAW.CUSTOMER_ORDER C ON O.ORDER_ID = C.ORDER_ID";
var stmt = snowflake.createStatement({sqlText: sql_command});
stmt.execute();
return "Values inserted successfully!";
$$;

-- POPULATING RAW TABLES

-- STEP 1: CREATING FILE FORMAT (we have data in CSV files so we'll create a CSV type file)

create or replace file format csv_format
type = csv
field_delimiter = ','
field_optionally_enclosed_by = '"'
skip_header = 1
null_if = ('NULL', 'null')
empty_field_as_null = True
compression = auto;


-- STEP 2: CREATING STAGES (INTERNAL) FOR ALL TABLES  
	## Data is coppied into stages before populated in tables
	## Internal means -- Data is present on same 

create or replace stage CUSTOMERS
file_format = (format_name = 'CSV_format', type = 'csv')
copy_options = (on_error = skip_file)
comment = 'this is an internal stage';

create or replace stage CUSTOMER_ORDER
file_format = (format_name = 'CSV_format', type = 'csv')
copy_options = (on_error = skip_file)
comment = 'this is an internal stage';

create or replace stage ORDER_DETAILS
file_format = (format_name = 'CSV_format', type = 'csv')
copy_options = (on_error = skip_file)
comment = 'this is an internal stage';

create or replace stage PRODUCTS
file_format = (format_name = 'CSV_format', type = 'csv')
copy_options = (on_error = skip_file)
comment = 'this is an internal stage';

create or replace stage PROD_CATEGORY
file_format = (format_name = 'CSV_format', type = 'csv')
copy_options = (on_error = skip_file)
comment = 'this is an internal stage';

-- STEP 3: UPLOADING FILES AND COPYING THEM IN THEIR RESPECTIVE TABLES

 -- for CUSTOMERS TABLE
put file://‪D:/data1/New_data/data/customers.csv @customers‬		        ## directory is on developer machine where respective csv file lying 
copy into customers from @customers;					                        ## @customers is the name of Internal Stage

 -- for CUSTOMER_ORDER TABLE
put file://‪D:/data1/New_data/data/CUSTOMER_ORDER.csv @CUSTOMER_ORDER‬	## directory is on developer machine where respective csv file lying
copy into CUSTOMER_ORDER from @CUSTOMER_ORDER;				                ## @CUSTOMER_ORDER is the name of Internal Stage


 -- for ORDER_DETAILS TABLE
put file://‪D:/data1/New_data/data/ORDER_DETAILS.csv @ORDER_DETAILS	    ## directory is on developer machine where respective csv file lying
copy into ORDER_DETAILS from @ORDER_DETAILS;				                   ## @ORDER_DETAILS is the name of Internal Stage


 -- for PRODUCTS TABLE
put file://‪D:/data1/New_data/data/PRODUCTS.csv @PRODUCTS          ## directory is on developer machine where respective csv file lying
copy into PRODUCTS from @PRODUCTS;                                ## @PRODUCTS is the name of Internal Stage


 -- for PROD_CATEGORY TABLE
put file://‪D:/data1/New_data/data/customers.csv @PROD_CATEGORY‬		## directory is on developer machine where respective csv file lying
copy into PROD_CATEGORY from @PROD_CATEGORY;				              ## @PROD_CATEGORY is the name of Internal Stage


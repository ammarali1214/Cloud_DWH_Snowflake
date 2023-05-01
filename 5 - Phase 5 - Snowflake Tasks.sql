--TASKS ONLINE_STORE_DWH

-- TASK_D_PRODUCT_CATEGORY
create or replace task TASK_D_PRODUCT_CATEGORY
warehouse = compute_wh
schedule = 'using cron 1 0 * * * Asia/Dubai'   ## This task will be run every day at 1st minute past midnight (12am) according to the Asia/Dubai timezone 
as call insert_d_product_category();           ## call <'Stored_Procedure_Name'>(); this statement is used to call/Initialize a snowflake stored Procedure

-- TASK_ D_PRODUCT
create or replace task TASK_D_PRODUCT
warehouse = COMPUTE_WH
schedule = 'using cron 3 0 * * * Asia/Dubai'  ## This task will be run every day at 3rd minute past midnight (12am) according to the Asia/Dubai timezone
as call insert_d_product();                   ## call <'Stored_Procedure_Name'>(); this statement is used to call/Initialize a snowflake stored Procedure

-- TASK_D_CUSTOMER
create or replace task TASK_D_CUSTOMER
warehouse = COMPUTE_WH
schedule = 'using cron 5 0 * * * Asia/Dubai' ## This task will be run every day at 5th minute past midnight (12am) according to the Asia/Dubai timezone 
as call insert_d_customer();                 ## call <'Stored_Procedure_Name'>(); this statement is used to call/Initialize a snowflake stored Procedure

TASK_F_ORDERS
create or replace task TASK_F_ORDERS
WAREHOUSE = COMPUTE_WH
schedule = 'using cron 7 0 * * * Asia/Dubai'  ## This task will be run every day at 7th minute past midnight (12am) according to the Asia/Dubai timezone
as call insert_f_orders();                    ## call <'Stored_Procedure_Name'>(); this statement is used to call/Initialize a snowflake stored Procedure


-- IMPORTANT
-- by default, all tasks are suspended. We have to resume them all with following command to be executed on set time:
-- alter task <'task_name'> <resume/suspend>;

-- TO CHECK IF TASK IS RUNNING, following SQL statemensts can be used:
-- 1) select * from table(information_schema.task_history( scheduled_time_range_start=>dateadd('hour',-1, current_timestamp()), result_limit => 10, task_name=>'demo_f_orders'));
-- 2) select * from table (information_schema.task_history()) where name = <'task_name'> order by scheduled_time;

-- TO EXECUTE TASK(s) MANNUALLY:
-- execute task <'task_name'>;

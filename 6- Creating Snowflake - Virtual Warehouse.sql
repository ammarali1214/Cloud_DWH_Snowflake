-- To Create WAREHOUSES

-- 1- ETL_WAREHOUSE
CREATE WAREHOUSE ETL_WAREHOUSE
WITH WAREHOUSE_SIZE = 'SMALL' -- there're some other sizes as well (XSMALL | SMALL | MEDIUM | LARGE | XLARGE | XXLARGE | XXXLARGE | X4LARGE | X5LARGE | X6LARGE)
warehouse_type = 'standard'
auto_suspend = 600            -- if there's no activity, warehouse waits for 600seconds and put warehouse in suspened mode
auto_resume = True            -- if warehouse detects any activity on warehouse, it resumes itself automatically 
max_cluster_count = 3         -- it ranges from 1-10
min_cluster_count = 2         -- it ranges from 1-10

-- if min_cluster_count = max_cluster_count - its maximum state -- all clusters will be running even if less computing power is required
-- if min_cluster_count < max_cluster_count - its autoscale state -- in this case Warehouse decide itself to run number of warehouse clusters according to the required computation 


-- 2- DATA_ANALYSIS_WAREHOUSE
CREATE WAREHOUSE DATA_ANALYSIS_WAREHOUSE
WITH WAREHOUSE_SIZE = 'SMALL'   -- there're some other sizes as well (XSMALL | SMALL | MEDIUM | LARGE | XLARGE | XXLARGE | XXXLARGE | X4LARGE | X5LARGE | X6LARGE)
warehouse_type = 'standard'     -- 
auto_suspend = 600              -- if there's no activity, warehouse waits for 600seconds and put warehouse in suspened mode
auto_resume = True              -- if warehouse detects any activity on warehouse, it resumes itself automatically
max_cluster_count = 3           -- it ranges from 1-10
min_cluster_count = 2;          -- it ranges from 1-10


--IMPORTANT COMMANDS:
-- To resume a warehouse:
-- alter warehouse <warehouse_name> resume;

-- To change the size of a warehouse in Snowflake:
-- <warehouse_name> set warehouse_size = '<new_size>';

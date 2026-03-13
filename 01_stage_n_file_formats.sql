USE ROLE SUPPLY_CHAIN_ROLE;
USE DATABASE SCM_DB;
USE SCHEMA SUPPLY_CHAIN;

-- 1. Create a File Format - I am creating a CSV format here.
CREATE OR REPLACE FILE FORMAT my_csv_format
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  NULL_IF = ('NULL', 'null')
  EMPTY_FIELD_AS_NULL = TRUE;

-- 2. Create an Internal Stage 
CREATE OR REPLACE STAGE my_internal_stage
  FILE_FORMAT = my_csv_format;



LIST @my_internal_stage;
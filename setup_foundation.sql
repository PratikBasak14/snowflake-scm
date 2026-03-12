-- I an creating a dedicated role for this project.
use role accountadmin;
create role if not exists SUPPLY_CHAIN_ROLE;

GRANT ROLE SUPPLY_CHAIN_ROLE TO ROLE SYSADMIN;
GRANT ROLE SUPPLY_CHAIN_ROLE TO USER "PRATIK59";

-- Creating the warehouse.
Create warehouse if not exists SUPPLY_CHAIN_WAREHOUSE
WITH 
    WAREHOUSE_SIZE = 'XSMALL' -- Using XSMALL for cost efficiency, as this is a demo project. Adjust size based on workload needs.
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

-- creating a database and schema 
create database if not exists scm_db;
create schema if not exists scm_db.supply_chain;


-- Grant permissions to our role
GRANT ALL PRIVILEGES ON DATABASE scm_db TO ROLE SUPPLY_CHAIN_ROLE;
GRANT ALL PRIVILEGES ON SCHEMA scm_db.supply_chain TO ROLE SUPPLY_CHAIN_ROLE;
GRANT USAGE ON WAREHOUSE SUPPLY_CHAIN_WAREHOUSE TO ROLE SUPPLY_CHAIN_ROLE;



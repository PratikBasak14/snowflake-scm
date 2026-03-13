USE ROLE SUPPLY_CHAIN_ROLE;
USE DATABASE SCM_DB;
USE SCHEMA SUPPLY_CHAIN;

-- Load Products
COPY INTO DIM_PRODUCTS FROM @my_internal_stage/dim_products.csv;

-- Load Locations
COPY INTO DIM_LOCATIONS FROM @my_internal_stage/dim_locations.csv;

-- Load Suppliers
COPY INTO DIM_SUPPLIERS FROM @my_internal_stage/dim_suppliers.csv;

-- Load Date
COPY INTO DIM_DATE FROM @my_internal_stage/dim_date.csv;

-- Load Fact Table
COPY INTO FACT_INVENTORY FROM @my_internal_stage/fact_inventory.csv;



-- Sanity Check
SELECT 
    (SELECT COUNT(*) FROM DIM_PRODUCTS) as PROD_COUNT,
    (SELECT COUNT(*) FROM DIM_LOCATIONS) as LOC_COUNT,
    (SELECT COUNT(*) FROM FACT_INVENTORY) as FACT_COUNT;

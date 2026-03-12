USE ROLE SUPPLY_CHAIN_ROLE;
USE DATABASE scm_db;
USE SCHEMA supply_chain;

-- dim_products - I am storing the product details in this table.
-- Also, here i am using string data type inplace of varchar as both are same in snowflake.
create or replace table dim_products (
    product_id string,
    product_name string,
    category string,
    unit_price number
);

-- dim_locations - I am storing the location details in this table.
create or replace table dim_locations (
    location_id string,
    location_name string,
    city string,
    region string
);

-- dim_suppliers - I am storing the supplier details in this table.
create or replace table dim_suppliers (
    supplier_id string,
    supplier_name string,
    contact_email string,
    country string
);

-- dim_date - I am storing the date and time details in this table.
create or replace table dim_date (
    date_id number,
    full_date date,
    day_of_week string,
    month string,
    year number
);

-- fact_inventory - I am storing the inventory details in this table.
create or replace table fact_inventory (
    fact_id number,
    date_id number,
    product_id string,
    location_id string,
    supplier_id string,
    quantity_on_hand number,
    reorder_point number
);
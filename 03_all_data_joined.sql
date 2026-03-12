USE ROLE SUPPLY_CHAIN_ROLE;
USE DATABASE SCM_DB;
USE SCHEMA SUPPLY_CHAIN;
-- creating the one big table (obt) for analysis
create or replace table obt_joined_data as
with inventory_health as (
    select 
        f.fact_id,
        d.full_date,
        p.product_name,
        p.category,
        p.unit_price,
        l.location_name,
        l.city,
        s.supplier_name,
        f.quantity_on_hand,
        f.reorder_point
    from fact_inventory f
    left join dim_products p on f.product_id = p.product_id
    left join dim_locations l on f.location_id = l.location_id
    left join dim_suppliers s on f.supplier_id = s.supplier_id
    left join dim_date d on f.date_id = d.date_id
)
select 
    *,
    (quantity_on_hand * unit_price) as total_inventory_value,
    case 
        when quantity_on_hand < reorder_point then 'reorder now'
        when quantity_on_hand < (reorder_point * 1.2) then 'low stock'
        else 'healthy'
    end as stock_status
from inventory_health;

-- verify the results
select * from obt_joined_data;
with base as (
    select 
        supplier_name,
        sum(total_inventory_value) as supplier_inventory_value,
        count(distinct product_name) as unique_products
    from obt_joined_data
    group by 1
)
select 
    *,
    round(100 * (supplier_inventory_value / sum(supplier_inventory_value) over()), 2) as pct_of_total_value
from base
order by pct_of_total_value desc;
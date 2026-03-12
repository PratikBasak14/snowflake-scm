with base as (
    select 
        category,
        avg(quantity_on_hand) as avg_stock,
        avg(reorder_point) as avg_reorder_point,
        sum(total_inventory_value) as total_category_value
    from obt_joined_data
    group by 1
)
select 
    *,
    case 
        when avg_stock > (avg_reorder_point * 2) then 'overstocked'
        else 'balanced'
    end as inventory_strategy
from base;
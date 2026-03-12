with base as (
    select 
        city,
        stock_status,
        count(*) as product_count,
        sum(total_inventory_value) as value_at_risk
    from obt_joined_data
    group by 1, 2
)
select * from base
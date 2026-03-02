with order_items as (
    select * from {{ ref('stg_order_items') }}
),
final as(
    select 
        order_id,
        count(order_item_id) as total_items,
        sum(price) as total_price,
        sum(freight_value) as total_freight_value,
        (sum(price) + sum(freight_value)) as total_order_amount
    from order_items
    group by order_id
)
select * from final
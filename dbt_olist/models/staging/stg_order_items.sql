with source as (
    select * from {{ source('olist_raw', 'olist_order_items_dataset') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['order_id', 'order_item_id']) }} as order_item_pk,
        order_id,
        order_item_id,
        product_id,
        seller_id,
        shipping_limit_date as shipping_limit_at,
        cast(price as numeric) as price,
        cast(freight_value as numeric) as freight_value
    from source
)

select * from renamed
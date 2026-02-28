with source as (
    select * from {{ source('olist_raw', 'olist_orders_dataset') }}
),

renamed as (
    select
        -- primary key
        order_id,
        
        -- foreign keys
        customer_id,
        
        -- details
        order_status,
        
        -- timestamps (đã là timestamp nên chỉ cần giữ nguyên hoặc alias lại cho đẹp)
        order_purchase_timestamp as purchased_at,
        order_approved_at as approved_at,
        order_delivered_carrier_date as delivered_carrier_at,
        order_delivered_customer_date as delivered_at,
        order_estimated_delivery_date as estimated_delivery_at
    from source
)

select * from renamed
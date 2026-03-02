with customers as (
    select * from {{ ref('stg_customers') }}
),

geolocation as (
    select * from {{ ref('stg_geolocation') }}
),

final as (
    select
        c.customer_id,
        c.customer_unique_id,
        c.zip_code_prefix,
        c.customer_city,
        c.customer_state,
        
        g.latitude as customer_lat,
        g.longitude as customer_lng
    from customers c
    left join geolocation g 
        on c.zip_code_prefix = g.zip_code_prefix
)

select * from final
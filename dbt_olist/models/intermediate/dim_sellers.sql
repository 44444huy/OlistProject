with sellers as (
    select * from {{ ref('stg_sellers') }}
),

geolocation as (
    select * from {{ ref('stg_geolocation') }}
),

final as (
    select
        s.seller_id,
        s.zip_code_prefix,
        s.seller_city,
        s.seller_state,
        -- Lấy tọa độ kho hàng của người bán
        g.latitude as seller_lat,
        g.longitude as seller_lng
    from sellers s
    left join geolocation g 
        on s.zip_code_prefix = g.zip_code_prefix
)

select * from final
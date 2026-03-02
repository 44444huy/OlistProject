with products as (
    select * from {{ ref('stg_products') }}
),

translation as (
    select * from {{ ref('stg_product_category_name_translation') }}
),

final as (
    select
        p.product_id,
        -- Ưu tiên lấy tên tiếng Anh, nếu không có thì giữ tên gốc
        coalesce(t.product_category_name_english, p.product_category_name) as product_category_name,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm
    from products p
    left join translation t 
        on p.product_category_name = t.product_category_name_portuguese
)

select * from final
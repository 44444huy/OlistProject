with sources as (
    select *
    -- Sửa lại đúng tên bảng là olist_sellers_dataset
    from {{ source('olist_raw', 'olist_sellers_dataset') }}
),
renamed as (
    select
        -- primary key
        seller_id,
        
        -- details
        -- Lưu ý: Kiểm tra xem bảng gốc có cột seller_name không. 
        -- Trong schema BigQuery của bạn thường chỉ có id, zip, city, state.
        cast(seller_zip_code_prefix as string) as zip_code_prefix,
        seller_city,
        seller_state
    from sources
)
-- Phải có dòng này dbt mới chạy được
select * from renamed
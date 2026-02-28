with source as(
    select * from {{ source('olist_raw', 'olist_customers_dataset') }}
),
renamed as (
    select
        -- primary key
        customer_id,
        
        -- details
        customer_unique_id,
        cast(customer_zip_code_prefix as string)  as zip_code_prefix,
        customer_city,
        customer_state
    from source
)
select * from renamed
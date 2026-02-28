with source as (
    select * from {{ source('olist_raw', 'olist_geolocation_dataset') }}
),
final as (
    select
        cast(geolocation_zip_code_prefix as string) as zip_code_prefix,
        avg(geolocation_lat) as latitude,
        avg(geolocation_lng) as longitude,
        any_value(geolocation_city) as city,
        any_value(geolocation_state) as state
    from source
    group by 1
)
select * from final
with sources as (
    select *
    from {{ source('olist_raw', 'olist_geolocation_dataset') }}
),
renamed as (
    select
        cast(geolocation_zip_code_prefix as string)  as zip_code_prefix,
        geolocation_lat as lat,
        geolocation_lng as lng,
        geolocation_city as city,
        geolocation_state as state
    from sources
)
select * from renamed
with source as (
    select * from {{ source('olist_raw', 'olist_order_reviews_dataset') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['review_id', 'order_id']) }} as order_review_pk,
        review_id,
        order_id,
        review_score,
        review_comment_title,
        review_comment_message,
        review_creation_date as review_created_at,
        review_answer_timestamp as review_answered_at
    from source
)

select * from renamed
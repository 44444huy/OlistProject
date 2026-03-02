with order_reviews as (
    select * from {{ ref('stg_order_reviews') }}
),

final as (
    select
        order_id,
        count(order_review_pk) as total_reviews,
        avg(review_score) as avg_review_score,
        max(review_created_at) as latest_review_answer_at
    from order_reviews
    group by 1
)

select * from final
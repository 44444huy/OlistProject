with orders as (
    select * from {{ ref('stg_orders') }}
),

items_summary as (
    select * from {{ ref('int_order_items_summarized') }}
),

payments_summary as (
    select * from {{ ref('int_order_payment_summarized') }}
),

reviews_summary as (
    select * from {{ ref('int_order_reviews_summarized') }}
),
final as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.purchased_at,
        o.delivered_at,
        o.estimated_delivery_at, 
        timestamp_diff(o.delivered_at, o.purchased_at, day) as delivery_time_days,
        case when o.delivered_at > o.estimated_delivery_at then 1 else 0 end as is_late_delivery,

        i.total_items,
        i.total_price,
        i.total_freight_value,
        i.total_order_amount,
        
        
        p.total_payment_amount,
        
        r.avg_review_score
        
    from orders o
    left join items_summary i on o.order_id = i.order_id
    left join payments_summary p on o.order_id = p.order_id
    left join reviews_summary r on o.order_id = r.order_id
)
select * from final
with order_payment as (
    select * from {{ ref('stg_order_payment') }}
),
final as(
    select 
        order_id,
        count(payment_sequential) as total_payment_sequences,
        sum(payment_amount) as total_payment_amount
    from order_payment
    group by order_id
)
select * from final
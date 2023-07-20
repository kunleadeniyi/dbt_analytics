with payments as (
    select 
    id as payment_id,
    orderid as order_id,
    status, amount, 
    created as created_at
    from {{ source('stripe', 'stripe_payments') }}
)
select * from payments
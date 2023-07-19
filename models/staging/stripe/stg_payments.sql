with payments as (
    select 
    id as payment_id,
    orderid as order_id,
    status, amount, created::DATE
    from public.stripe_payments
)
select * from payments
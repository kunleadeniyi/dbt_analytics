with orders as (
   select * from {{ ref('stg_orders') }} 
),

payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
    select o.order_id, 
    o.customer_id, 
    o.order_date,
    p.amount 
    from payments p, orders o
    where o.order_id = p.order_id
    and o.status = 'completed'
    and p.status = 'success'
)
select * from final

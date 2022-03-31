with dim_customers as (
    select * from {{ref('dim_customers')}}
)
select customer_id from dim_customers where number_of_orders < 0
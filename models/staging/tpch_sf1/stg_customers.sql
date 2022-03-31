
with customers as (
    select 
        c_custkey as customer_id, 
        c_name as customer_name 
    from 
        {{source('tpch_sf1','customer')}}
) select * from customers
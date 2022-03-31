with orders as (
    select 
        o_orderkey as order_id, 
        o_custkey as customer_id, 
        o_orderstatus as status,
        o_orderdate as order_date,
        o_clerk as clerk,
        o_totalprice as totalprice,
        o_orderpriority as orderpriority
    from 
        {{source('tpch_sf1','orders')}}

) select * from orders
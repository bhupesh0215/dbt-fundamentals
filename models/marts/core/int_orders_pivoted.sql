{%- set orderpriorites = ['1-URGENT', '2-HIGH', '3-MEDIUM', '4-NOT SPECIFIED', '5-LOW'] -%}

with orders as (
    select * from {{ ref('stg_orders') }}
), pivoted as (
    select 
        clerk,
        {%- for orderpriority in orderpriorites %}
          sum(case when orderpriority = '{{ orderpriority }}' then {{ cent_to_dollar('totalprice', 4) }}  else 0 end) as "{{ orderpriority }}" 
          {%- if not loop.last -%}
              , 
          {%- endif -%}
        {% endfor %}
    from orders 
    group by 1
) select * from pivoted
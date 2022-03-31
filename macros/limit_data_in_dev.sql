{%- macro limit_data_in_dev(column_name, num_of_days) -%}
    {%- if target.name == 'dev' -%}
        where {{column_name}} >= dateadd('day', -{{num_of_days}}, current_timestamp)
    {%- endif -%}
{%- endmacro -%}
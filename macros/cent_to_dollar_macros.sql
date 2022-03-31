{%- macro cent_to_dollar(column_name, decimal_places=2) -%}
    round( 1.0 * {{ column_name }}, {{ decimal_places }} ) / 100
{%- endmacro -%}
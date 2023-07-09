(# 
    This macro categorises the value by high, average and low
#)

{% macro value_category_description(value_farm_gate__ksh_) -%}
    case
        when value_farm_gate__ksh_ <= 1000000 then 'low value'
        when value_farm_gate__ksh_ > 1000000 and value_farm_gate__ksh_ <= 10000000 then 'average value'
        when value_farm_gate__ksh_ > 10000000 then 'high value'
    end
{%- endmacro %}

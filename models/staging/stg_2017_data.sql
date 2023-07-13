{{ config(materialized="view") }}

select
    -- identifiers
    cast(_id as integer) as id,
    -- timestamps
    cast(year as string) as year,
    -- production info
    cast(county as string) as county,
    cast(crop as string) as crop,
    cast(area__ha_ as int) as area__ha,
    cast(production__mt_ as int) as production__mt,
    cast(value_farm_gate__ksh_ as int) as value_farm_gate__ksh,
    case when area__ha_ != 0 then cast(production__mt_ as int) / cast(area__ha_ as int) else null end as yield,
    {{value_category_description('value_farm_gate__ksh_') }} as value_category 

from {{ source("staging", "production_table_2017") }}


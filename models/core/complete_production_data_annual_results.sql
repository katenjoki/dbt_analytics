{{ config(materialized="table") }}

with
    prod_data as (
        select *
        from {{ ref("complete_production_data") }})

        select
            year,
            county,
            sum(value_farm_gate__ksh) as total_value__ksh,
            sum(production__mt) as total_production__mt,
            sum(area__ha) as total_area__ha,
            sum(yield) as total_yield,
            count(distinct(crop)) as total_unique_crops

        from prod_data
        group by year, county
        order by total_value__ksh desc


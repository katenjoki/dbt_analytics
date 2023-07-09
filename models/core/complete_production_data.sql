{{ config(materialized="table") }}

with prod_2017_data as (
    select *
    from {{ ref('stg_2017_data') }}
), 

prod_2018_data as (
    select *
    from {{ ref('stg_2018_data') }}
), 

data_unioned as (
    select * from prod_2017_data
    union all
    select * from prod_2018_data
), 

county_codes as (
    select * from {{ ref('county_codes') }}
)
select
    row_number() over () as id,
    data_unioned.year, 
    data_unioned.county, 
    county_codes.county_code,
    data_unioned.crop,
    data_unioned.area__ha,
    data_unioned.production__mt,
    data_unioned.value_farm_gate__ksh, 
    data_unioned.yield,
    data_unioned.value_category
from data_unioned
inner join county_codes
on data_unioned.county = county_codes.county
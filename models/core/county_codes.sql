{{ config(materialized="table") }}

select county_code, county from {{ ref('county_code_lookup')}}
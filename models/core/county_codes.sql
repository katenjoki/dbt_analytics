{{ config(materialized="table") }}

select county_code,county,coordinates from {{ ref('county_code_lookup')}}
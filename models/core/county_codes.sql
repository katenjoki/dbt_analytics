{{ config(materialized="table") }}

select county_code,county,latitude,longitude from {{ ref('county_code_lookup')}}
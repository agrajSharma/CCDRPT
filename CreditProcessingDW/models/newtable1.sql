{{ config(
    materialized='table'
) }}

WITH cte1 AS (
    select 1 As trainid 
)
SELECT * FROM cte1
{{ config(
    materialized='incremental',
    unique_key='TranID',
    incremental_strategy = 'merge',
    merge_update_columns = ['transactionamount']
) }}

WITH updated_data AS (
    SELECT
        TranID,
        CASE
            WHEN transactionamount IS NULL THEN '1000.00'
            ELSE transactionamount
        END AS transactionamount
    FROM {{ ref('ccard_primary') }}
)

SELECT * FROM updated_data
{{ config(
  materialized='incremental',
  incremental_strategy='insert_overwrite',
  partition_by={'field': 'block_timestamp', 'data_type': 'timestamp'}
) }}

SELECT
  *
FROM
  {{ source('ethereum_raw', 'transactions') }}
WHERE
  DATE(block_timestamp) BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
  AND CURRENT_DATE()
  {% if is_incremental() %}
  AND block_timestamp >= (
    SELECT MAX(block_timestamp) FROM {{ this }}
  )
  {% endif %}
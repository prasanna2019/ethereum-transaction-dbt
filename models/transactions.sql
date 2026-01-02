{{ config(materialized='table') }}

SELECT
  `hash`,
  FORMAT_TIMESTAMP('%A',block_timestamp ) as day,
  transaction_type
FROM
  {{source ('eth','transactions')}}
WHERE
  block_timestamp BETWEEN CURRENT_TIMESTAMP() - INTERVAL 5 DAY
  AND CURRENT_TIMESTAMP()
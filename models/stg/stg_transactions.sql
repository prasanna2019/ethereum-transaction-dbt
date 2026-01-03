{{ config(materialized='table') }}

SELECT 
  * EXCEPT(value, gas_price, receipt_status, block_timestamp),
  value / 1e9 AS value_gwei,
  gas_price / 1e9 AS gas_price_gwei,
  receipt_status AS status,
  DATE(block_timestamp) AS block_date
FROM {{ ref('transactions') }}
{{ config(materialized='table') }}

SELECT 
  COUNT(DISTINCT `hash`) AS trxns,
  transaction_type
FROM {{ ref('stg_transactions') }}
GROUP BY transaction_type
ORDER BY transaction_type


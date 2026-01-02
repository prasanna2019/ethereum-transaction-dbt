{{ config(materialized='table') }}

SELECT count(distinct `hash`) as trxns, transaction_type from {{ref('transactions')}}, 
group by transaction_type order by transaction_type
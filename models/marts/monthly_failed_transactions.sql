{{ config(materialized='table',
   ) }}

select count(distinct (`hash`)) as failed_transactions from {{ ref('fct_transactions') }} where status = 0 
and block_date between date_trunc(current_date, month) and date_sub(date_add(date_trunc(current_date, month), interval 1 month), interval 1 day)
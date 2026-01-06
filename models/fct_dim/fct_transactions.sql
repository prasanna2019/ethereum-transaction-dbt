{{ config(
  materialized='incremental',
  incremental_strategy='insert_overwrite',
  partition_by={'field': 'block_date', 'data_type': 'date'}
) }}

select * 
from {{ ref('stg_transactions') }}

{% if is_incremental() %}
where block_date >= (
    select max(block_date) from {{ this }}
)
{% endif %}
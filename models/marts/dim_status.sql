-- models/marts/dim_status.sql

with source as (
    select * from {{ ref('stg_bronze__status') }}
)

select
    STATUS_ID,
    STATUS
from source

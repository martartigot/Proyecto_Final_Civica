-- models/marts/dim_constructor.sql

with source as (
    select * from {{ ref('stg_bronze__constructors') }}
)

select
    CONSTRUCTOR_ID,
    CONSTRUCTOR_REF,
    CONSTRUCTOR_NAME,
    CONSTRUCTOR_NATIONALITY
from source

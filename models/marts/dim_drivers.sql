-- models/marts/dim_driver.sql

with source as (
    select * from {{ ref('stg_bronze__drivers') }}
)

select
    DRIVER_ID,
    DRIVER_REF,
    DRIVER_NUMBER,
    DRIVER_CODE,
    DRIVER_FORENAME,
    DRIVER_SURNAME,
    DRIVER_NATIONALITY
from source

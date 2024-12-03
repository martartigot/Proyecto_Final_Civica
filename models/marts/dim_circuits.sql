-- models/marts/dim_circuit.sql

with source as (
    select * from {{ ref('stg_bronze__circuits') }}
)

select
    CIRCUIT_ID,
    CIRCUIT_REF,
    CIRCUIT_NAME,
    LOCATION,
    COUNTRY,
    LAT,
    LNG,
    ALT
from source

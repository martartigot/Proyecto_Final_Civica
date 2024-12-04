-- models/marts/fct_qualifying.sql

WITH source AS (
    SELECT * FROM {{ ref('stg_bronze__qualifying') }}
)

SELECT
    QUALIFY_ID,
    RACE_ID,
    DRIVER_ID,
    CONSTRUCTOR_ID,
    QUALIFY_POSITION,
    Q1_TIME,
    Q2_TIME,
    Q3_TIME
FROM source

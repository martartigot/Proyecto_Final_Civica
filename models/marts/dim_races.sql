-- models/marts/dim_races.sql

WITH source AS (
    SELECT * FROM {{ ref('stg_bronze__races') }}
)

SELECT
    RACE_ID,
    SEASON,
    RACE_ROUND,
    CIRCUIT_ID,
    RACE_NAME,
    RACE_DATE,
    RACE_TIME
FROM source

-- models/marts/fct_driver_standings.sql

WITH source AS (
    SELECT * FROM {{ ref('stg_bronze__driver_standings') }}
)

SELECT
    DRIVER_STANDING_ID,
    RACE_ID,
    DRIVER_ID,
    POINTS,
    WINS,
    POSITION
FROM source

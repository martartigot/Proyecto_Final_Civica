-- models/marts/fct_constructor_standings.sql

WITH source AS (
    SELECT * FROM {{ ref('stg_bronze__constructor_standings') }}
)

SELECT
    CONSTRUCTOR_STANDING_ID,
    RACE_ID,
    CONSTRUCTOR_ID,
    POINTS,
    WINS,
    POSITION
FROM source

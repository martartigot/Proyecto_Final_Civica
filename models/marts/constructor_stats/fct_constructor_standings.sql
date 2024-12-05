-- models/marts/fct_constructor_standings.sql

WITH source AS (
    SELECT * FROM {{ ref('stg_bronze__constructor_standings') }}
),
races AS (
    SELECT
        RACE_ID,
        SEASON
    FROM {{ ref('stg_bronze__races') }}
),
constructors AS (
    SELECT
        CONSTRUCTOR_ID,
        CONSTRUCTOR_NAME
    FROM {{ ref('stg_bronze__constructors') }}
)

SELECT
    cs.CONSTRUCTORSTANDINGs_ID,
    cs.RACE_ID,
    cs.CONSTRUCTOR_ID,
    cs.CONSTRUCTOR_POINTS,
    cs.CONSTRUCTOR_WINS,
    cs.CONSTRUCTOR_POSITION,
    r.SEASON,
    c.CONSTRUCTOR_NAME
FROM source cs
LEFT JOIN races r ON cs.RACE_ID = r.RACE_ID
LEFT JOIN constructors c ON cs.CONSTRUCTOR_ID = c.CONSTRUCTOR_ID

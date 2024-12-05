-- models/marts/fct_qualifying.sql

WITH source AS (
    SELECT * FROM {{ ref('stg_bronze__qualifying') }}
),
races AS (
    SELECT 
        RACE_ID,
        SEASON
    FROM {{ ref('stg_bronze__races') }}
),
drivers AS (
    SELECT 
        DRIVER_ID,
        DRIVER_FORENAME || ' ' || DRIVER_SURNAME AS DRIVER_NAME
    FROM {{ ref('stg_bronze__drivers') }}
),
constructors AS (
    SELECT 
        CONSTRUCTOR_ID,
        CONSTRUCTOR_NAME
    FROM {{ ref('stg_bronze__constructors') }}
)

SELECT
    q.QUALIFY_ID,
    q.RACE_ID,
    q.DRIVER_ID,
    d.DRIVER_NAME,
    q.CONSTRUCTOR_ID,
    c.CONSTRUCTOR_NAME,
    q.FINAL_POSITION,
    q.Q1_TIME,
    q.Q2_TIME,
    q.Q3_TIME,
    r.SEASON
FROM source q
LEFT JOIN races r
    ON q.RACE_ID = r.RACE_ID
LEFT JOIN drivers d
    ON q.DRIVER_ID = d.DRIVER_ID
LEFT JOIN constructors c
    ON q.CONSTRUCTOR_ID = c.CONSTRUCTOR_ID


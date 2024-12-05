-- models/marts/dim_race_circuit.sql

WITH circuits AS (
    SELECT 
        CIRCUIT_ID,
        CIRCUIT_REF,
        CIRCUIT_NAME,
        LOCATION,
        COUNTRY,
        LAT,
        LNG,
        ALT
    FROM {{ ref('stg_bronze__circuits') }}
),
races AS (
    SELECT
        RACE_ID,
        SEASON,
        RACE_ROUND,
        CIRCUIT_ID,
        RACE_NAME,
        RACE_DATE,
        RACE_TIME
    FROM {{ ref('stg_bronze__races') }}
)

SELECT
    r.RACE_ID,
    r.SEASON,
    r.RACE_ROUND,
    r.CIRCUIT_ID,  
    r.RACE_NAME,
    r.RACE_DATE,
    r.RACE_TIME,
    c.CIRCUIT_REF,
    c.CIRCUIT_NAME,
    c.LOCATION,
    c.COUNTRY,
    c.LAT,
    c.LNG,
    c.ALT
FROM races r
LEFT JOIN circuits c
    ON r.CIRCUIT_ID = c.CIRCUIT_ID

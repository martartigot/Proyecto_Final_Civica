-- models/marts/fct_results.sql

WITH base_results AS (
    SELECT *
    FROM {{ ref('stg_bronze__results') }}
),
constructor_points AS (
    SELECT
        race_Id,
        constructor_Id,
        constructor_points
    FROM {{ ref('stg_bronze__constructor_results') }}
),
status_mapping AS (
    SELECT
        status_Id,
        status
    FROM {{ ref('stg_bronze__status') }}
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
    r.result_Id,
    r.race_Id,
    r.driver_Id,
    r.constructor_Id,
    r.grid_position,
    r.final_position,
    r.driver_points,
    cp.constructor_points,
    s.status AS status,
    ra.SEASON,
    d.DRIVER_NAME,
    c.CONSTRUCTOR_NAME
FROM base_results r
LEFT JOIN constructor_points cp
    ON r.race_Id = cp.race_Id
    AND r.constructor_Id = cp.constructor_Id
LEFT JOIN status_mapping s
    ON r.status_Id = s.status_Id
LEFT JOIN races ra
    ON r.race_Id = ra.RACE_ID
LEFT JOIN drivers d
    ON r.driver_Id = d.DRIVER_ID
LEFT JOIN constructors c
    ON r.constructor_Id = c.CONSTRUCTOR_ID

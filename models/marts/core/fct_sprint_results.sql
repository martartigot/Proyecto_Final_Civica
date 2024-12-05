-- models/marts/fct_sprint_results.sql

WITH base_sprint_results AS (
    SELECT *
    FROM {{ ref('stg_bronze__sprint_results') }}
),
status_mapping AS (
    SELECT
        status_id,
        status
    FROM {{ ref('stg_bronze__status') }}
),
races AS (
    SELECT 
        race_id,
        season
    FROM {{ ref('stg_bronze__races') }}
),
drivers AS (
    SELECT 
        driver_id,
        driver_forename || ' ' || driver_surname AS driver_name
    FROM {{ ref('stg_bronze__drivers') }}
),
constructors AS (
    SELECT 
        constructor_id,
        constructor_name
    FROM {{ ref('stg_bronze__constructors') }}
)

SELECT
    sr.sprintresult_id,
    sr.race_id,
    sr.driver_id,
    sr.constructor_id,
    sr.final_position,
    sr.driver_points,
    sr.laps,
    s.status AS status,
    r.season,
    d.driver_name,
    c.constructor_name
FROM base_sprint_results sr
LEFT JOIN status_mapping s
    ON sr.status_id = s.status_id
LEFT JOIN races r
    ON sr.race_id = r.race_id
LEFT JOIN drivers d
    ON sr.driver_id = d.driver_id
LEFT JOIN constructors c
    ON sr.constructor_id = c.constructor_id

-- models/marts/fct_driver_standings.sql

WITH source AS (
    SELECT * FROM {{ ref('stg_bronze__driver_standings') }}
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
)

SELECT
    ds.driverstandings_id,
    ds.race_id,
    ds.driver_id,
    ds.driver_points,
    ds.wins,
    ds.driver_position,
    r.season,
    d.driver_name
FROM source ds
LEFT JOIN races r
    ON ds.race_id = r.race_id
LEFT JOIN drivers d
    ON ds.driver_id = d.driver_id


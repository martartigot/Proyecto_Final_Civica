-- models/marts/fct_lap_times_pit_stops.sql

WITH lap_times_base AS (
    SELECT
        race_id,
        driver_id,
        lap,
        lap_miliseconds
    FROM {{ ref('stg_bronze__lap_times') }}
),
pit_stops_base AS (
    SELECT
        race_id,
        driver_id,
        lap,
        stop,
        stop_milliseconds
    FROM {{ ref('stg_bronze__pit_stops') }}
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
    lt.race_id,
    lt.driver_id,
    lt.lap,
    lt.lap_miliseconds,
    ps.stop_milliseconds,
    ps.stop AS pit_stop_number,
    r.season,
    d.driver_name
FROM lap_times_base lt
LEFT JOIN pit_stops_base ps
    ON lt.race_id = ps.race_id
    AND lt.driver_id = ps.driver_id
    AND lt.lap = ps.lap
LEFT JOIN races r
    ON lt.race_id = r.race_id
LEFT JOIN drivers d
    ON lt.driver_id = d.driver_id


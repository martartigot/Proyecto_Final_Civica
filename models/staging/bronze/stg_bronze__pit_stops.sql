WITH source AS (
    SELECT * 
    FROM {{ source('bronze', 'pit_stops') }}
),

renamed AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['raceid', 'driverid', 'stop', 'lap']) }} AS pitStop_id,
        raceid AS race_id,
        driverid AS driver_id,
        stop,
        lap,
        time AS stop_time,
        TRY_CAST(duration AS FLOAT) AS stop_duration, 
        milliseconds AS stop_milliseconds
    FROM source
)

SELECT * 
FROM renamed


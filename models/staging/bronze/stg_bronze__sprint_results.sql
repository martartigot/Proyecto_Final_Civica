with 

source as (

    select * from {{ source('bronze', 'sprint_results') }}

),

renamed as (

    select
        resultid AS sprintResult_id,
        raceid AS race_id,
        driverid AS driver_id,
        constructorid AS constructor_id,
        number AS driver_number,
        grid AS grid_position,
        coalesce(position, '') AS position,
        CASE 
            WHEN positiontext = 'R' THEN 'Retired'
            WHEN positiontext = 'N' THEN 'Not classified'
            WHEN positiontext = 'W' THEN 'Withdrawn'
            ELSE positiontext 
        END AS positiontext,
        positionorder AS final_position,
        points AS driver_points,
        laps,
        coalesce(time, '') AS time,
        coalesce(milliseconds, '') AS milliseconds,
        coalesce(fastestlap, '') AS fastestlap,
        coalesce(fastestlaptime, '') AS fastestlaptime,
        statusid AS status_id

    from source

)

select * from renamed

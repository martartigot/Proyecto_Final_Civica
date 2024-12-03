with 

source as (

    select * from {{ source('bronze', 'results') }}

),

renamed as (

    select
        resultid AS result_id,
        raceid AS race_id,
        driverid AS driver_id,
        constructorid AS constructor_id,
        number AS driver_number,
        grid AS grid_position,
        coalesce(position, '') AS final_position,
        positionorder AS final_rank,
        points AS driver_points,
        laps,
        coalesce(time, '') AS time,
        coalesce(milliseconds, '') AS milliseconds,
        coalesce(fastestlap, '') AS fastestlap,
        coalesce(rank, '') AS fastestlap_rank,
        coalesce(fastestlaptime, '') AS fastestlaptime,
        coalesce(fastestlapspeed, '') AS fastestlapspeed,
        statusid AS status_id

    from source

)

select * from renamed

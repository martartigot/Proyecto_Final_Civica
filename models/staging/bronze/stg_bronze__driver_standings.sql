with 

source as (

    select * from {{ source('bronze', 'driver_standings') }}

),

renamed as (

    select
        driverstandingsid AS driverStandings_id,
        raceid AS race_id,
        driverid AS driver_id,
        points AS driver_points,
        position AS driver_position,
        positiontext,
        wins

    from source

)

select * from renamed

with 

source as (

    select * from {{ source('bronze', 'lap_times') }}

),

renamed as (

    select
        raceid AS race_id,
        driverid AS driver_id,
        lap,
        position AS race_position,
        time AS lap_time,
        milliseconds AS lap_miliseconds

    from source

)

select * from renamed

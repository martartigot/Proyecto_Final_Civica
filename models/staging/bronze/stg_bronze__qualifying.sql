with 

source as (

    select * from {{ source('bronze', 'qualifying') }}

),

renamed as (

    select
        qualifyid AS qualify_id,
        raceid AS race_id,
        driverid AS driver_id,
        constructorid AS constructor_id,
        number AS driver_number,
        position AS final_position,
        coalesce(q1, '') AS q1_time,
        coalesce(q2, '') AS q2_time,
        coalesce(q3, '') AS q3_time

    from source

)

select * from renamed

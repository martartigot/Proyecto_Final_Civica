with 

source as (

    select * from {{ source('bronze', 'drivers') }}

),

renamed as (

    select
        driverid AS driver_id,
        driverref AS driver_ref,
        COALESCE(number, 0) AS driver_number, 
        COALESCE(code, '') AS driver_code,
        forename AS driver_forename,
        surname AS driver_surname,
        nationality AS driver_nationality

    from source

)

select * from renamed

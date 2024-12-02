with 

source as (

    select * from {{ source('bronze', 'circuits') }}

),

renamed as (

    select
        circuitid AS circuit_id,
        circuitref AS circuit_ref,
        name AS circuit_name,
        location,
        country,
        lat,
        lng,
        alt

    from source

)

select * from renamed

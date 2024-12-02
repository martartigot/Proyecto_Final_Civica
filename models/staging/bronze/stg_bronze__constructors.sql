with 

source as (

    select * from {{ source('bronze', 'constructors') }}

),

renamed as (

    select
        constructorid AS constructor_id,
        constructorref AS constructor_ref,
        name AS constructor_name,
        nationality AS constructor_nationality

    from source

)

select * from renamed

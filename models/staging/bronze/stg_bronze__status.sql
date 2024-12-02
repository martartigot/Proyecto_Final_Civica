with 

source as (

    select * from {{ source('bronze', 'status') }}

),

renamed as (

    select
        statusid AS status_id,
        status

    from source

)

select * from renamed

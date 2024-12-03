with 

source as (

    select * from {{ source('bronze', 'races') }}

),

renamed as (

    select
        raceid AS race_id,
        year,
        round AS race_round,
        circuitid AS circuit_id,
        name AS race_name,
        date AS race_date,
        coalesce(time, '00:00:00') AS race_time

    from source

)

select * from renamed

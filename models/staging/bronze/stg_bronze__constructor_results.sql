with 

source as (

    select * from {{ source('bronze', 'constructor_results') }}

),

renamed as (

    select
        constructorresultsid AS constructorResults_id,
        raceid AS race_id,
        constructorid AS constructor_id,
        points AS constructor_points,
        CASE 
            WHEN status = 'D' THEN 'Disqualified'
            WHEN status IS NULL THEN '' 
            ELSE status 
        END AS status

    from source

)

select * from renamed

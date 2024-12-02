with 

source as (

    select * from {{ source('bronze', 'constructor_standings') }}

),

renamed as (

    select
        constructorstandingsid AS constructorStandings_id,
        raceid AS race_id,
        constructorid AS constructor_id,
        points AS constructor_points,
        position AS constructor_position,
        CASE 
            WHEN positiontext = 'E' THEN 'Excluded' 
            ELSE positiontext 
        END AS position_text,
        wins AS constructor_wins

    from source

)

select * from renamed

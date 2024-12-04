with base_results as (
    select *
    from {{ ref('stg_bronze__results') }}
),
constructor_points as (
    select
        raceId,
        constructorId,
        points as constructor_points
    from {{ ref('stg_bronze__constructor_results') }}
),
status_mapping as (
    select
        statusId,
        status
    from {{ ref('stg_bronze__status') }}
)
select
    r.resultId,
    r.raceId,
    r.driverId,
    r.constructorId,
    r.grid,
    r.positionOrder,
    r.points,
    cp.constructor_points,
    s.status as status
from base_results r
left join constructor_points cp
    on r.raceId = cp.raceId
    and r.constructorId = cp.constructorId
left join status_mapping s
    on r.statusId = s.statusId

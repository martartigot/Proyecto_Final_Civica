with base_sprint_results as (
    select *
    from {{ ref('stg_bronze__sprint_results') }}
),
status_mapping as (
    select
        statusId,
        status
    from {{ ref('stg_bronze__status') }}
)
select
    sr.sprintResultId,
    sr.raceId,
    sr.driverId,
    sr.constructorId,
    sr.position,
    sr.points,
    sr.laps,
    s.status as status
from base_sprint_results sr
left join status_mapping s
    on sr.statusId = s.statusId

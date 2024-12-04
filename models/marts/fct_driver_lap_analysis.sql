with lap_times_base as (
    select
        raceId,
        driverId,
        lap,
        milliseconds as lap_time_ms
    from {{ ref('stg_bronze__lap_times') }}
),
pit_stops_base as (
    select
        raceId,
        driverId,
        lap,
        stop,
        milliseconds as pit_stop_time_ms
    from {{ ref('stg_bronze__pit_stops') }}
)
select
    lt.raceId,
    lt.driverId,
    lt.lap,
    lt.lap_time_ms,
    ps.pit_stop_time_ms,
    ps.stop as pit_stop_number
from lap_times_base lt
left join pit_stops_base ps
    on lt.raceId = ps.raceId
    and lt.driverId = ps.driverId
    and lt.lap = ps.lap

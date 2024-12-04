{% snapshot races_snp %}

{{
    config(
        target_schema='snapshots', 
        unique_key='race_id',  
        strategy='check',  
        check_cols=['race_date', 'race_time'],  
        updated_at='current_timestamp()' 
    )
}}

select
    race_id,
    season,
    race_round,
    circuit_id,
    race_name,
    race_date,
    race_time
from {{ ref('stg_bronze__races') }}

{% endsnapshot %}

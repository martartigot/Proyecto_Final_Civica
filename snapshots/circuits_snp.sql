{% snapshot circuits_snp %}

{{
    config(
        target_schema='snapshots',  
        unique_key='circuit_id', 
        strategy='check',         
        check_cols=['lng', 'name'], 
        updated_at='current_timestamp()' 
    )
}}

select
    circuit_id,
    circuit_ref,
    circuit_name,
    location,
    country,
    lat,
    lng,
    alt
from {{ ref('stg_bronze__circuits') }} 

{% endsnapshot %}

{{ config(materialized='view') }}

with fhv_data as (
    select *
    FROM {{ ref("stg_fhv_tripdata") }}
    where PULocationID is not null
    and DOLocationID is not null
),

dim_zones as (
    select * from {{ ref("dim_zones") }}
    where borough != 'Unknown'
)

select  
    fhv_data.dispatching_base_num,
   cast(fhv_data.pickup_datetime as timestamp) as pickup_datetime,
   cast(fhv_data.dropOff_datetime as timestamp) as dropoff_datetime,
   pickup_zone.borough as pickup_borough,
   pickup_zone.zone as pickup_zone,
   dropoff_zone.borough as dropoff_borough,
   dropoff_zone.zone as dropoff_zone,
   cast(fhv_data.PULocationID as integer) as pickup_locationid,
   cast(fhv_data.DOLocationID as integer) as dropoff_locationid,
   fhv_data.SR_Flag
from fhv_data
inner join dim_zones as pickup_zone
on cast(fhv_data.PULocationID as integer) = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on cast(fhv_data.DOLocationID as integer) = dropoff_zone.locationid
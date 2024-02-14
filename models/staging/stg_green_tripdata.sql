{{ config(materialized='view') }}

SELECT * FROM {{ source("staging", "green_tripdata_partitioned_clustered") }}
LIMIT 100
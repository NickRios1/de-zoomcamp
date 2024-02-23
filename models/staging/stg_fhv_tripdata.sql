{{ config(materialized='view') }}

SELECT *
from {{ source("staging", "fhv_tripdata_non_partitioned") }}
where pickup_datetime between '2019-01-01 00:00:00' AND '2019-12-31 23:59:59'
-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=false) %}
    
    LIMIT 100

{% endif %}
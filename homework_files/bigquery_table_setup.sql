--  QUESTION #3  --

CREATE OR REPLACE EXTERNAL TABLE `crypto-truck-411918.ny_taxi.external_fhv_tripdata` (
  dispatching_base_num STRING,
  pickup_datetime STRING,
  dropOff_datetime STRING,
  PULocationID STRING,
  DOLocationID STRING,
  SR_Flag STRING,
  Affiliated_base_number STRING
)
OPTIONS (
  format = 'csv',
  uris = ['gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-01.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-02.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-03.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-04.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-05.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-06.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-07.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-08.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-09.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-10.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-11.csv.gz',
          'gs://model_04_homework/fhv_data/2019/fhv_tripdata_2019-12.csv.gz']
);

CREATE OR REPLACE TABLE crypto-truck-411918.ny_taxi.fhv_tripdata_non_partitioned AS
SELECT * FROM crypto-truck-411918.ny_taxi.external_fhv_tripdata;

SELECT COUNT(*) FROM `crypto-truck-411918.dbt_sampling.fact_fhv_trips`;


--  QUESTION #4  --

-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `crypto-truck-411918.ny_taxi.m4_green_taxi_data`
OPTIONS (
  format = 'csv',
  uris = ['gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-01.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-02.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-03.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-04.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-05.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-06.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-07.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-08.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-09.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-10.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-11.csv.gz',
          'gs://model_04_homework/green_taxi_data/2019/green_tripdata_2019-12.csv.gz']
);

CREATE OR REPLACE EXTERNAL TABLE `crypto-truck-411918.ny_taxi.m4_yellow_taxi_data`
OPTIONS (
  format = 'csv',
  uris = ['gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-01.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-02.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-03.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-04.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-05.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-06.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-07.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-08.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-09.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-10.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-11.csv.gz',
          'gs://model_04_homework/yellow_taxi_data/2019/yellow_tripdata_2019-12.csv.gz']
);

SELECT COUNT(*) FROM `crypto-truck-411918.ny_taxi.m4_yellow_taxi_data`;


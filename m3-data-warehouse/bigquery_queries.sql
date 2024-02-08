--  SETUP  --

-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `crypto-truck-411918.ny_taxi.external_green_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-01.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-02.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-03.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-04.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-05.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-06.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-07.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-08.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-09.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-10.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-11.parquet',
	  'gs://model_03_homework_bucket/green_taxi_data_2022/green_tripdata_2022-12.parquet']
);

-- Create a non-partitioned table from external table
CREATE OR REPLACE TABLE crypto-truck-411918.ny_taxi.green_tripdata_non_partitioned AS
SELECT * FROM crypto-truck-411918.ny_taxi.external_green_tripdata;


--  QUESTION #1  --

SELECT COUNT(*) FROM crypto-truck-411918.ny_taxi.green_tripdata_non_partitioned;

--  QUESTION #2  --

SELECT COUNT(DISTINCT PULocationID) FROM crypto-truck-411918.ny_taxi.external_green_tripdata;

SELECT COUNT(DISTINCT PULocationID) FROM crypto-truck-411918.ny_taxi.green_tripdata_non_partitioned;

--  QUESTION #3 --

SELECT COUNT(*) FROM crypto-truck-411918.ny_taxi.external_green_tripdata WHERE fare_amount = 0;

--  QUESTION #4  --

CREATE OR REPLACE TABLE crypto-truck-411918.ny_taxi.green_tripdata_partitioned_clustered
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PULocationID AS 
SELECT * FROM crypto-truck-411918.ny_taxi.external_green_tripdata;

--  QUESTION #5  --

SELECT DISTINCT PULocationID FROM crypto-truck-411918.ny_taxi.green_tripdata_non_partitioned
WHERE lpep_pickup_datetime BETWEEN '2022-06-01' AND '2022-06-30';

SELECT DISTINCT PULocationID FROM crypto-truck-411918.ny_taxi.green_tripdata_partitioned_clustered
WHERE lpep_pickup_datetime BETWEEN '2022-06-01' AND '2022-06-30';

--  QUESTION #8 (BONUS)  --

SELECT COUNT(*) FROM crypto-truck-411918.ny_taxi.green_tripdata_non_partitioned;

import pyarrow as pa
import pyarrow.parquet as pq
import os
from pandas import DataFrame

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/crypto-truck-411918-8d0f19be9ed4.json"

bucket_name = 'mage-zoomcamp-nr'
project_id = 'crypto-truck-411918'

table_name = "green_taxi_data"

root_path = f'{bucket_name}/{table_name}'

@data_exporter
def export_data(data: DataFrame, *args, **kwargs):

    table = pa.Table.from_pandas(data)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path=root_path,
        partition_cols=['lpep_pickup_date'],
        filesystem=gcs
    )

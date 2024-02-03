if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test
import re


@transformer
def transform(data, *args, **kwargs):

     data = filter_passengers_and_trip_distance(data)
     data = add_date_columns(data)
     data = standardize_column_names(data)

     return data

def filter_passengers_and_trip_distance(data):

    print("Rows with zero passengers: ", data['passenger_count'].isin([0]).sum())
    print("Rows with no trip distance: ", data['trip_distance'].isin([0.0]).sum())

    filtered_df = data[(data['passenger_count'] > 0) & (data['trip_distance'] > 0.0)]

    return filtered_df

def add_date_columns(data):

    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date
    data['lpep_dropoff_date'] = data['lpep_dropoff_datetime'].dt.date

    return data

def standardize_column_names(data):

    check_for_camel_case(data.columns)
    check_vendor_id(data)

    data.columns = (data.columns
                .str.replace('(?<=[a-z])(?=[A-Z])', '_', regex=True)
                .str.lower()
                .str.replace(' ', '_')
    )

    return data

def check_for_camel_case(columns):

     camel_case = r'(?:[A-Z][a-z]*)+'
     counter = 0

     for name in columns:
        if re.match(camel_case, name):
            counter += 1

     print('There are', counter, 'column(s) with Camel Case.')

def check_vendor_id(data):
     print('Existing Values of VendorID in the dataset: ', data['VendorID'].unique())

@test
def test_output(output, *args):
    assert "vendor_id" in output.columns, 'vendor_id is not one of the existing values in the column'
    assert output['passenger_count'].isin([0]).sum() == 0, 'There are rides with zero passengers'
    assert output['trip_distance'].isin([0.0]).sum() == 0, 'There are rides with zero trip distance'

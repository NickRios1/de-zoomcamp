locals {
  data_lake_bucket = "dtc_data_lake"
}

variable "project" {
    description = "Your GCP Project ID"
    default = "crypto-truck-411918"
}

variable "region" {
  description = "Region for GCP resources. Choose as per your location: http://cloud.google.com/about/locations"
  default = "us-central1"
  type = string
}

variable "location" {
  description = "Project Location"
  default = "US"
}

#Not needed for now
variable "bucket_name" {
  description = "The name of the Google Cloud Storage bucket. Must be globally unique"
  default = ""
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check offical docs for more info"
  default = "STANDARD"
}

variable "BQ_DATASET" {
    description = "BigQuery Dataset that raw data (from GCS) will be written to"
    type = string
    default = "demo_dataset"
}

variable "TABLE_NAME" {
  description = "BigQuery Table"
  type = string
  default = "ny_trips"
}
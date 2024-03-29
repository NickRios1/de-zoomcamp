terraform {
    required_version = ">= 1.0"
    backend "local" {} # Can change from "local" to "gcs" (for google) or "s3" (for aws)
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "5.6.0"
        }
    }
}

provider "google" {
    project = var.project
    region = var.region
    // credentials = file(var.credentials) # Use this if you do not want to set env-var GOOGLE_APPLICAITON_CREDENTIALS
}

# Data Lake Bucket
# ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "data-lake-bucket" {
  name = "${local.data_lake_bucket}_${var.project}" #Concatenating DL bucket & project name 
  location = var.location

  #optional, but recommended settings:
  storage_class = var.storage_class
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
        type = "AbortIncompleteMultipartUpload"
    }
    condition {
        age = 1 // days
    }
  }

  force_destroy = true
}

resource "google_bigquery_dataset" "demo_dataset" {
    dataset_id = var.BQ_DATASET
    project = var.project
    location = var.location
}

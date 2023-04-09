provider "google" {
  project     = "devsubba"
  region      = "ap-south-1"
  credentials = "keys.json"
}
# terraform {
#   backend "gcs" {
#     bucket = "terraform-backend-test-subba"
#     prefix = "terraform/state"
#   }
# }

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  environment  = var.environment
}
module "compute" {
  source = "./modules/compute"
}
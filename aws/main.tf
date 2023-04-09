module "vpc" {
    source = "./modules/vpc"
    region = var.region
    env = var.env
    project_name = var.project_name
}
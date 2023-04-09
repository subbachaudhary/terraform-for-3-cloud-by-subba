module "virtual-network" {
    source = "./modules/virtual-network"
    project_name = var.project_name
    environment = var.environment
    region = var.region
  
}
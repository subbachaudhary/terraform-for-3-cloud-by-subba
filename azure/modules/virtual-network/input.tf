variable "project_name" {}
variable "environment" {}
variable "region" {}
variable "address_space" {
    description = "defining vpc range"
    type        = list
    default = ["192.168.0.0/16"]
}  
# variable "dns_servers" {
#     description = "defining dns server addresses"
#     type        = list(string)
#     default     = ["192.168.0.1", "192.168.0.2"]
# } 
variable "project_name" {
    description = "define project name"
    type        = string
    default = "azure"
}
variable "environment" {
    description = "define environment name for the project"
    type        = string
    default = "dev"
}
variable "region" {
    description = "define region name"
    type        = string
    default = "West Europe"
}
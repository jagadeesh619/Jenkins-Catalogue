variable "project_name" {
    type=string
    default = "roboshop"
}

variable "environment" {
    type=string
    default = "dev"
}
variable "common_tags" {
  type = map
  default = {
    terraform=true
  }
}
variable "zone_name" {

  default = "infome.website"

}
variable "appversion" {
  default = ""
}
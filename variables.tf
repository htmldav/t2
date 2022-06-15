# variable "cli_usr_access_key" {
#   type    = string
#   default = "access_key" # specify the access key
# }
# variable "cli_usr_secret_key" {
#   type    = string
#   default = "secret_key" # specify the secret key
# }
variable "region" {
  type    = string
  default = "us-east-1" # specify the region
}
variable "tags" {
  type        = map(string)
  description = "mapping of tags to assign to the instance"
  default = {
    terraform = "true"
    Name      = "terraform-instance"
  }
}
variable "key_name" {
  type        = string
  description = "ssh key to connect to instance"
  default     = "/root/.ssh/id_rsa" # specify the login key name
}
variable "instance_type" {
  type        = string
  description = "instance type for the instance"
  default     = "t2.micro" # specify the instance type
}
variable "ami_id" {
  type        = string
  description = "os image id for the instance. use free-tier ami id before runnning to avoid unwanted cost"
  default     = "ami-09d56f8956ab235b3" # specify the image id
}
# variable "subnet_id" {
#   type        = string
#   description = "subnet id to launch the instance in"
#   default     = "subnet_id" # specify the az id like ap-south-1a, or us-west-2a, or your choice
# }
# variable "vpc_id" {
#   type        = string
#   description = "vpc"
#   default     = "vpc_id" # specify the vpc id
# }
# variable "availability_zone" {
#   type        = string
#   description = "az to start the instance in"
#   default     = "availability_zone_id" # specify the az id
# }
variable "instance_count" {
  type        = number
  description = "instances count. under free-tier we can have 3 linux instances of 8 gb each or 1 window instance of 30 gb"
  default     = 1 # specify the instances count
}
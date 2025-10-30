variable "name" {}
variable "instance_type" { default = "t3.micro" }
variable "subnet_id" {}
variable "key_name" {}
variable "security_group_ids" { type = list(string) }
variable "iam_instance_profile" {}

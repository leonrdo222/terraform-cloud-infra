variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "S3 bucket ACL"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to the bucket"
  type        = map(string)
  default     = {}
}

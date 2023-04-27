variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket"
  default     = "cp-web-hosting-bucket"
  type        = string
}


variable "domain_complete_cors" {
  description = "Complete domain cors example https://mycoolsyte.ext"
  default     = "cp-web-hosting-bucket"
  type        = string
}

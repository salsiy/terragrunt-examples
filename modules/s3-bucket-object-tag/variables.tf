variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "object_key" {
  description = "S3 object key"
  type        = string
}

variable "object_content" {
  description = "Content of the S3 object"
  type        = string
}

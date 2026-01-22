
variable "Project" {
  description = "Project name for tagging resources in AWS"
  default     = "the-csoc"
}

variable "Contact" {
  description = "Contact information for tagging resources in AWS"
  default     = "houimli@kubelab.io"
}

variable "AWS_Region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "backend_s3" {

  description = "S3 backend resource name for the deployement user"
  default     = "the-csoc-tf-state"

}
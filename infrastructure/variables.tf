
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

output "infra_user_access_key_id" {
  value     = aws_iam_access_key.infra_user_key.id
  sensitive = true
}

output "infra_user_secret_access_key" {
  value     = aws_iam_access_key.infra_user_key.secret
  sensitive = true
}

variable "prefix" {
  description = "prefix for resouces in AWS"
  default     = "the-csoc"
}
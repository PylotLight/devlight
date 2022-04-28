variable "aws_region" {
  description = "AWS Region"
  default     = "ap-southeast-2"
}

variable "azure_region" {
  description = "Azure Region"
  default     = "aus-south"
}

variable "AZURE_CLIENT_ID" {
  description = "AZURE_CLIENT_ID"
  type        = string
  sensitive   = true
}

variable "AZURE_CLIENT_SECRET" {
  description = "AZURE_CLIENT_SECRET"
  type        = string
  sensitive   = true
}

variable "AZURE_SUBSCRIPTION_ID" {
  description = "AZURE_SUBSCRIPTION_ID"
  type        = string
  sensitive   = true
}
variable "AZURE_TENANT_ID" {
  description = "AZURE_TENANT_ID"
  type        = string
  sensitive   = true
}


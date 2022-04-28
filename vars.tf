variable "aws_region" {
  description = "AWS Region"
  default     = "ap-southeast-2"
}

variable "azure_region" {
  description = "Azure Region"
  default     = "australiasoutheast"
}

variable "ARM_CLIENT_ID" {
  description = "AZURE CLIENT ID"
  type        = string
  sensitive   = true
}

variable "ARM_CLIENT_SECRET" {
  description = "AZURE CLIENT SECRET"
  type        = string
  sensitive   = true
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "AZURE SUBSCRIPTION ID"
  type        = string
  sensitive   = true
}
variable "ARM_TENANT_ID" {
  description = "AZURE TENANT ID"
  type        = string
  sensitive   = true
}


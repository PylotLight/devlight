#AWS
variable "aws_region" {
  description = "AWS Region"
  default     = "ap-southeast-2"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS ACCESS KEY ID"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS SECRET ACCESS KEY"
  type        = string
  sensitive   = true
}

#Azure
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


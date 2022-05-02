#AWS
variable "aws_region" {
  description = "AWS Region"
  default     = "ap_southeast_2"
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

#Oracle
variable "OCI_tenancy_ocid" {
  description = "tenancy_ocid"
  type        = string
  sensitive   = true
}
variable "OCI_user_ocid" {
  description = "user_ocid"
  type        = string
  sensitive   = true
}
variable "private_key" {
  description = "rsa_private_key"
  type        = string
  sensitive   = true
}
variable "OCI_fingerprint" {
  description = "fingerprint"
  type        = string
  sensitive   = true
}
variable "OCI_region_identifier" {
  description = "region_identifier"
  type        = string
  default     = "ap-melbourne-1"
}

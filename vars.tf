#AWS
variable "aws_region" {
  description = "AWS Region"
  default     = "ap-southeast-2"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS ACCESS KEY ID"
  type        = string
  sensitive   = true
  default     = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS SECRET ACCESS KEY"
  type        = string
  sensitive   = true
  default     = ""
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
  default     = ""
}

variable "ARM_CLIENT_SECRET" {
  description = "AZURE CLIENT SECRET"
  type        = string
  sensitive   = true
  default     = ""
}

# variable "ARM_client_certificate_path" {
#   description = "ARM_client_certificate_path"
#   type        = string
#   sensitive   = true
# }

# variable "ARM_client_certificate_password" {
#   description = "ARM_client_certificate_password"
#   type        = string
#   sensitive   = true
# }

variable "ARM_SUBSCRIPTION_ID" {
  description = "AZURE SUBSCRIPTION ID"
  type        = string
  sensitive   = true
  default     = ""
}
variable "ARM_TENANT_ID" {
  description = "AZURE TENANT ID"
  type        = string
  sensitive   = true
  default     = ""
}

# variable "resource_group_name_prefix" {
#   default     = "azure_rg"
#   description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
# }

#GCP
variable "GOOGLE_CREDENTIALS" {
  description = "GOOGLE CREDENTIALS"
  type        = string
  sensitive   = true
  default     = ""
}

variable "GCP_Region" {
  description = "GCP Region"
  default     = "australia-southeast2"
}

variable "GCP_Zone" {
  description = "GCP Zone"
  default     = "australia-southeast2-a"
}

variable "GCP_Project" {
  description = "GCP Project"
  default     = "devlight-350705"
}




# #Oracle
# variable "OCI_tenancy_ocid" {
#   description = "tenancy_ocid"
#   type        = string
#   sensitive   = true
#   default     = ""
# }
# variable "OCI_user_ocid" {
#   description = "user_ocid"
#   type        = string
#   sensitive   = true
#   default     = ""
# }
# variable "OCI_rsa_private_key" {
#   description = "rsa_private_key"
#   type        = string
#   sensitive   = true
#   default     = ""
# }
# variable "OCI_rsa_private_key_password" {
#   description = "rsa_private_key_password"
#   type        = string
#   sensitive   = true
#   default     = ""
# }
# variable "OCI_fingerprint" {
#   description = "fingerprint"
#   type        = string
#   sensitive   = true
#   default     = ""
# }
# variable "OCI_region_identifier" {
#   description = "region_identifier"
#   type        = string
#   default     = "ap-melbourne-1"
# }

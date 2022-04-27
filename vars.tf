variable "name" {
  type        = string
  default     = ""
  description = "description data"
}

variable "aws_region" {
  description = "AWS region"
  default     = "ap-southeast-2"
}

variable "azure_region" {
  description = "azure region"
  default     = "aus-south"
}

variable "azure_subscription_id" {
  description = "Azure Subscription Id"
  default     = "f5621e33-8e82-405a-bf16-a0672a9080d4"
}
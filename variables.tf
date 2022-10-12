variable "subscription_id" {
  description = "id of the subscription in Azure where terraform will create resources."
  type        = string
  default     = "7a99359d-7165-4f18-933c-f3f7a2bbbc80"
}

variable "tenant_id" { # take from data source instead?
  description = "id of the tenant in Azure"
  type        = string
  default     = "85173d93-99ef-4dff-9b45-495719659133"
}
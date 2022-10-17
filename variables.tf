variable "subscription_id" {
  description = "id of the subscription in Azure where terraform will create resources."
  type        = string
  default     = "7a99359d-7165-4f18-933c-f3f7a2bbbc80"
}

variable "tenant_id" {
  description = "id of the tenant in Azure"
  type        = string
  default     = "85173d93-99ef-4dff-9b45-495719659133"
}

variable "user_id" {
  description = "Object id of the admin"
  type        = string
  default     = "1292f581-63df-4f18-b42f-025543c35883"
}

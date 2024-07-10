variable "apim" {
  type = object({
    name                = string
    resource_group_name = string
    workspace_name      = string
  })
}

variable "api" {
  type = object({
    name        = string
    path        = string
    product_ids = list(string)
    swagger_definition_content_format = string
    swagger_definition_content_value = string
  })
}

variable "inbound_policies" {
  type    = list(string)
  default = []
}

variable "apim" {
  type = object({
    name                = string
    resource_group_name = string
  })
}

variable "api" {
  type = object({
    name        = string
    path        = string
    product_ids = list(string)
    swagger_definition = object({
      content_format = string
      content_value  = string
    })
  })
}

variable "inbound_policies" {
  type    = list(string)
  default = []
}
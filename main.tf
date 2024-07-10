resource "azurerm_api_management_api" "api" {
  name                = local.api_name_formatted
  resource_group_name = var.apim.resource_group_name
  api_management_name = var.apim.name
  revision            = "1"
  display_name        = var.api.name
  protocols           = ["https"]
  path                = var.api.path

  dynamic "import" {
    for_each = var.api.swagger_definition != "" ? [1] : [0]
    content {
      content_format = var.api.swagger_definition.content_format
      content_value  = var.api.swagger_definition.content_value
    }
  }
}

resource "azurerm_api_management_api_policy" "this" {
  api_name            = local.api_name_formatted
  api_management_name = var.apim.name
  resource_group_name = var.apim.resource_group_name
  xml_content = data.template_file.default_policies.rendered
}

resource "azapi_resource" "api" {
  type = "Microsoft.ApiManagement/service/workspaces/apis@2023-05-01-preview"
  name = local.api_name_formatted
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.apim.resource_group_name}/providers/Microsoft.ApiManagement/service/${var.apim.name}/workspaces/${var.apim.workspace_name}"
  body = jsonencode({
    properties = {
      apiRevision = "1"
      displayName = var.api.name
      format = var.api.swagger_definition_content_format
      path = format(lower("%s-%s"), var.apim.workspace_name, var.api.path)
      protocols = ["https"]
      type = "http"
      value = var.api.swagger_definition_content_value
    }
  })
}

resource "azapi_resource" "api_policy" {
  type = "Microsoft.ApiManagement/service/workspaces/apis/policies@2023-05-01-preview"
  name = "policy"
  parent_id = azapi_resource.api.id
  body = jsonencode({
    properties = {
      format = "xml"
      value = data.template_file.default_policies.rendered
    }
  })
}
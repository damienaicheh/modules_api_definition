resource "azapi_resource" "products_links" {
  for_each            = toset(var.api.product_ids)
  type = "Microsoft.ApiManagement/service/workspaces/products/apiLinks@2023-05-01-preview"
  name = format("%s%s", local.api_name_formatted, each.value)
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.apim.resource_group_name}/providers/Microsoft.ApiManagement/service/${var.apim.name}/workspaces/${var.apim.workspace_name}/products/${each.value}" 
  body = jsonencode({
    properties = {
      apiId = azapi_resource.api.id
    }
  })
}
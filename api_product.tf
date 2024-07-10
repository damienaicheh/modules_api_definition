resource "azurerm_api_management_product_api" "products" {
  for_each            = toset(var.api.product_ids)
  api_name            = local.api_name_formatted
  product_id          = each.value
  api_management_name = var.apim.name
  resource_group_name = var.apim.resource_group_name
}

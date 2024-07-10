data "azurerm_client_config" "current" {}

data "template_file" "default_policies" {
  template = file("${path.module}/assets/policies/default_policies.tpl")
  vars = {
    api_name         = var.api.name
    inbound_policies = local.inbound_policies_formatted
  }
}

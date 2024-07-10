locals {
  api_name_formatted = lower(replace(var.api.name, " ", "-"))
  // concat all the inbound policies into a single string
  inbound_policies_formatted = join("\n", var.inbound_policies)
}

module "service_principal" {
  source            = "ptonini/service-principal/azuread"
  version           = "~> 2.0.0"
  count             = var.application_id == null ? 1 : 0
  scopes            = var.scopes
  group_memberships = var.group_memberships
  name              = var.name
}

resource "azuread_application_federated_identity_credential" "this" {
  for_each              = toset(var.subjects)
  application_id        = coalesce(var.application_id, module.service_principal[0].application_id)
  display_name          = "${var.name}-${index(var.subjects, each.value)}"
  audiences             = var.audiences
  issuer                = var.issuer
  subject               = each.value
}
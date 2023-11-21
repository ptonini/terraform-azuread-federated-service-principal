output "client_id" {
  value = var.application_id == null ? module.service_principal[0].client_id : null
}

output "object_id" {
  value = var.application_id == null ? module.service_principal[0].this.object_id : null
}
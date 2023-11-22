variable "name" {}

variable "application_id" {
  default = null
}

variable "scopes" {
  type = map(object({
    scope                = string
    role_definition_name = string
  }))
  default = {}
}

variable "group_memberships" {
  type    = set(string)
  default = []
}


variable "audiences" {
  type    = set(string)
  default = ["api://AzureADTokenExchange"]
}

variable "issuer" {
  type = string
}

variable "subjects" {
  type = list(string)
}
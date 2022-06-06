variable "subscription_id" {
  type = string

}

variable "tenant_id" {
  type = string

}
variable "resource_group_location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
    type = list

}

variable "vnet_address" {
  type = list
}


variable "subnet_prefix" {
    type = list

}
variable "subnet_name" {
    type = list

}

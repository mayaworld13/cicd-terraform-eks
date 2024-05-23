variable "cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "keyname" {
  type = string
}

variable "instancetype" {
  type = string
}
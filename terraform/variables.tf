variable "region" {
  type = string
  default = "us-west-2"
}

variable "canonical_id" {
  type = string
  default = "099720109477"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "auth"
}

variable "pub_key" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}
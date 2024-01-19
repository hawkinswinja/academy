variable "vpc-cidr" {
  type = string
}

variable "public" {
  type = list(string)
}

/*
variable "public2" {
  type = string
}

variable "private1" {
  type = string
}
*/

variable "private" {
  type = list(string)
}
/*
variable "public1-cidr" {
  type = string
}

variable "public2-cidr" {
  type = string
}
*/
variable "private-cidr" {
  type = list(string)
}

variable "public-cidr" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "ami" {
  type = string
}

variable "subnets" {
  type = list(string)
}
variable "asg-decrease" {
  type = number
}

variable "asg-increase" {
  type = number
} 

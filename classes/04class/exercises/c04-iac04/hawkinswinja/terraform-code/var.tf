variable "ami" {
  type = string
}
variable "subnets" {
  type = list(string)
}
variable "asg-d" {
  type = number
}

variable "asg-i" {
  type = number
} 

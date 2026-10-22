variable "name" {
  type        = string
  description = "Name prefix used for all resources"
}

variable "vpc_cidr" {
  type        = string
  description = "IP range for the VPC"
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block, for example 10.0.0.0/16."
  }
}

variable "azs" {
  type        = list(string)
  description = "Availability zones, one per subnet pair"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets, one per AZ"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets, one per AZ"
}

variable "allowed_https_cidrs" {
  type        = list(string)
  description = "CIDR ranges allowed to reach the web security group on port 443. Empty means no inbound access."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Extra tags applied to every resource"
  default     = {}
}
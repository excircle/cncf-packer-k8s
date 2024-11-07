variable "kubernetes_version" {
  type        = string
  description = "(required) The version of Kubernetes to pull"
  default     = "v1.30.1"
}

variable "ssh_username" {
  type        = string
  description = "(optional) The SSH username"
  default     = "ubuntu"
}

variable "instance_type" {
  type        = string
  description = "(optional) The EC2 instance type to use while building the AMI"
  default     = "t2.small"
}

variable "region" {
  type        = string
  description = "(optional) The zone to create the Packer image in"
  default     = "us-west-2"
}

variable "source_ami" {
  type        = string
  description = "(required) The source AMI to use"
  default     = "ami-03c983f9003cb9cd1"
}

variable "packer_tag_name" {
  type = string
  description = "Name tag to be applied to AWS AMI"
  default = "cncf-kubernetes"
}
variable "packer_tag_environment" {
  type = string
  description = "Environment tag to be applied to AWS AMI"
  default = "prod"
}
variable "packer_tag_version" {
  type = string
  description = "Version tag to be applied to AWS AMI"
  default = "0.1.0"
}

variable "packer_tag_project" {
  type = string
  description = "Project tag to be applied to AWS AMI"
  default = "MinIO CNCF Kubernetes"
}
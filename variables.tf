variable "cluster_name" {
  type        = string
  description = "The name of the existing EKS cluster."
}

variable "skip_self_access" {
  type        = bool
  default     = false
  description = ""
}

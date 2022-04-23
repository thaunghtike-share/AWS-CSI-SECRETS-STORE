variable "eks_cluster_name" {
  type        = string
  description = "the name of EKS cluster to deploy this helm chart"

}

variable "aws_region" {
  type        = string
  description = "the name of AWS region"

}
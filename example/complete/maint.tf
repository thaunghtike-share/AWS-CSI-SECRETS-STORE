module "aws-csi-secrets-store" {
  source = "../../"

  eks_cluster_name = "eksdemo1"
  aws_region       = "us-east-1"

}
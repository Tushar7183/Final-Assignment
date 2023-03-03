# ec2
output "run1" {
  value = module.ec2.ami-id
}

output "run2" {
  value = module.ec2.instance
}

# s3
output "run3" {
  value = module.s3.bucket
}

#vpc
output "run4" {
  value = module.vpc.subnet_cidr
}

output "run5" {
  value = module.vpc.subnet_tag
}
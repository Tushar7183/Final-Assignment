resource "aws_instance" "ec2-test" {
    tush = var.tush-id
    instance_type = var.instance
    tags = {
    "name" = "tushar"
    "owner" = "tushar.bansal@cloudeq.com"
    }
    volume_tags = {
    "name" = "tushar"
    "owner" = "tushar.bansal@cloudeq.com"
    }
}
  


resource "aws_s3_bucket" "s3" {
    bucket = var.bucket
    tags =   var.tags
        # "name" = "tushar-s3"
        # owner = "tushar.bansal@cloudeq.com"
        # purpose = "training"
    
}
    
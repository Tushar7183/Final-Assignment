# terraform {
#   backend "s3" {
#     bucket = "test-bucket"
#     key    = "tushar.tfstate"
#     region = "us-east-1"
    
#     dynamodb_table = "tushar-dynamo"
#   }
# }
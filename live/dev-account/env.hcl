locals {
  environment      = "dev"
  primary_region   = "us-east-1"
  
  # S3 bucket with MORE than 10 tags (to test limitation)
  bucket_tags = {
    Environment   = "dev"
    Application   = "MyApp"
    Team          = "Engineering"
    CostCenter    = "Development"
    Owner         = "hello@bohobot.com"
    DataClass     = "Internal"
    Backup        = "Daily"
    Monitoring    = "Enabled"
    Compliance    = "Standard"
    Version       = "1.0"
    Purpose       = "Testing"
    CreatedBy     = "Terraform"
  }
  
  object_tags = {
    Environment = "dev"
    Type        = "Config"
    Application = "MyApp"
    Version     = "1.0"
    Owner       = "Engineering"
    # Only 5 tags - well under the 10 tag limit for S3 objects
  }
}
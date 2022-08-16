provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "mfa"
}

locals {
    name  = "uat-r53"
    region = "us-east-2"
    tags = {
        Environment = "UAT"
        Terraform = "true"
    }
}

module "zones" {
  source = "../../../modules/R53"

  zones = {
    "uatgordy.com" = {
      comment = "uatgordy.com (uat)"
      
      tags = {
        Name = "uatgordy.com"
      }
    }
  }
}

module "records" {
  source = "../../../modules/R53"
  
  records = [
 
    {
      name = "uatcdn.gordyhealth.com"
      type = "A"
      alias = {
        name    = module.cloudfront.cloudfront_distribution_domain_name
        zone_id = module.cloudfront.cloudfront_distribution_hosted_zone_id
      }
    },
  ]
  depends_on = [module.zones]
}


module "s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  bucket        = "uat-website-gordy"
  acl           = "private"
  force_destroy = true
}


data "aws_iam_policy_document" "s3_policy" {
  version = "2012-10-17"
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_bucket.s3_bucket_arn}/*"]
    principals {
      type        = "AWS"
      identifiers = module.cloudfront.cloudfront_origin_access_identity_iam_arns
    }
  }
}

resource "aws_s3_bucket_policy" "docs" {
  bucket = module.s3_bucket.s3_bucket_id
  policy = data.aws_iam_policy_document.s3_policy.json
}


module "cloudfront" {
  source              = "terraform-aws-modules/cloudfront/aws"
  comment             = "CF distribution for UAT Gordy environment"

  wait_for_deployment = false

  create_origin_access_identity = true
  origin_access_identities = {
    uat_gordy_s3 = "cloudfront can access"
  }

  origin = {
    uat_gordy_s3 = {
      domain_name = module.s3_bucket.s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "uat_gordy_s3"
        # key in `origin_access_identities`
      }
    }
  }

  default_cache_behavior = {
    path_pattern           = "/static/*"
    target_origin_id       = "uat_gordy_s3" # key in `origin` above
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = false
    function_association = {
      viewer-request = {
        function_arn = aws_cloudfront_function.viewer_request.arn
      }
    }
  }

  custom_error_response = {
    error403 = {
      error_code         = 403
      response_code      = 404
      response_page_path = "/404.html"
    }
    error404 = {
      error_code         = 404
      response_code      = 404
      response_page_path = "/404.html"
    }
  }
  viewer_certificate = {
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_function" "viewer_request" {
  name    = "uat-gordy-cdn-viewer-request"
  runtime = "cloudfront-js-1.0"
  publish = true
  code    = file("${path.module}/viewer-request.js")
}
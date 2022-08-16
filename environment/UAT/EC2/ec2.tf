provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}
module "ec2_instance" {
  source  = "../../../modules/EC2"

  name = "Main-Saitama-1_RND"

  ami                    = "ami-078286b0bfbd4f284"
  instance_type          = "c5a.16xlarge"
  key_name               = "RND"
  monitoring             = true
  vpc_security_group_ids = [resource.aws_security_group.backend_security_group.id]
  subnet_id              = "subnet-03bb221c68b8c6730"
  enable_volume_tags = false
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 150
      volume_size = 1024
      tags = {
        Name = "backend-root-volume"
      }
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = "UAT"
    Name        = "Main-Saitama-1_RND"
  }
}
resource "aws_security_group" "backend_security_group" {

  name        = "backend-sg"
  description = "Security group for backend"
  vpc_id      = "vpc-02a4f594bc53dbd27"
  ingress {
    description      = "traffic from alb"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups = [resource.aws_security_group.alb_security_group.id]
    }
  ingress {
    description      = "traffic from bastion host"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [resource.aws_security_group.saitama-swap_security_group.id]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Terraform   = "true"
    Environment = "UAT"
    Name        = "backend-sg"
  }  
}

resource "aws_security_group" "alb_security_group" {
  name        = "ALB-security-group"
  description = "Allow alb inbound traffic"
  vpc_id      = "vpc-02a4f594bc53dbd27"

  ingress {
    description      = "traffic from alb"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Terraform   = "true"
    Environment = "UAT"
    Name = "ALB-security-group"
  }  
}
################################################################
#Public ec2 bastion-host
################################################################
resource "aws_security_group" "saitama-swap_security_group" {
  name        = "bastion-host-SG"
  description = "Allow all ssh from public"
  vpc_id      = "vpc-02a4f594bc53dbd27"

  ingress {
    description      = "traffic from public"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Terraform   = "true"
    Environment = "UAT"
    Name = "bastion-host-SG"
  }  
}

module "ec2" {
  source = "../../../modules/EC2"
  name                        = "saitama-swap"
  key_name                    =  "RND"
  ami                         = "ami-0285224013392ff4a"
  instance_type               = "t3.xlarge"
  subnet_id                   = "subnet-03bb221c68b8c6730"
  vpc_security_group_ids = [aws_security_group.saitama-swap_security_group.id]
  associate_public_ip_address = true
  tags = {
    Terraform   = "true"
    Environment = "UAT"
  }  
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "Terraform VPC"
  }
}

# Create a Public subnet in AZ1
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    "Name" = "Public subnet 1"
  }
}

# Create a Private subnet in AZ1
resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    "Name" = "Private subnet 1"
  }
}

# Create a Public subnet in AZ2
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"

  tags = {
    "Name" = "Public subnet 2"
  }
}

# Create a Private subnet in AZ2
resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-west-2b"

  tags = {
    "Name" = "Private subnet 2"
  }
}

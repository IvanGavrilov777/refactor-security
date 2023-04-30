# A security group for the ELB so to be accessible via the web
resource "aws_security_group" "elb" {
  name   = "elb_sec_grp"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #Allow only personal IP and VPC private subnet
    cidr_blocks = ["78.83.117.100/32","192.168.100.0/24"]
    // 78.83.117.100/32
    // 0.0.0.0/0
    // 192.168.1.0/24
    // 192.168.100.0/24
  }

  # Outbound internet access
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #Allow only personal IP and VPC private subnet
    cidr_blocks = ["78.83.117.100/32","192.168.100.0/24"]
    // 78.83.117.100/32
    // 0.0.0.0/0
    // 192.168.1.0/24
    // 192.168.100.0/24
  }
}

# VM security group
resource "aws_security_group" "VM_sec_grp" {
  name        = "VM_sec_grp"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "vpc_id" {}

# Get the latest Ubuntu 22.04 LTS AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Create an AWS key pair from your local public key
resource "aws_key_pair" "this" {
  key_name   = "my-key-pair"
  public_key = file("C:/Users/LATITUDE 5290 2in1/.ssh/id_ed25519.pub")
}

# Launch EC2 instance
resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true
  iam_instance_profile        = var.iam_instance_profile

  tags = {
    Name = var.name
  }
}

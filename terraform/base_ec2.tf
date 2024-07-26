// Security Group
resource "aws_security_group" "WORLDSKILLSAUS-dev-sg" {
  name   = "WORLDSKILLSAUS-dev-sg"
  vpc_id = aws_vpc.WORLDSKILLSAUS-vpc.id
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
  tags = {
    Name = "WORLDSKILLSAUS-DEV"
  }
  tags_all = {
    Name = "WORLDSKILLSAUS-DEV"
  }
}


// EC2 Instances
// box-001
resource "aws_instance" "vpn_server" {
  ami                         = "ami-032346ab877c418af" # Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-04-23
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.WORLDSKILLSAUS-dev-sg.id}"]
  subnet_id                   = aws_subnet.WORLDSKILLSAUS-subnet.id
  associate_public_ip_address = true
  key_name                    = "WORLDSKILLSAUS"
  tags = {
    Name = "demo-001"
  }
  tags_all = {
    Name = "demo-001"
  }
}

// box-002
resource "aws_instance" "box-002" {
  ami                         = "ami-032346ab877c418af" # Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-04-23
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.WORLDSKILLSAUS-dev-sg.id}"]
  subnet_id                   = aws_subnet.WORLDSKILLSAUS-subnet.id
  associate_public_ip_address = true
  key_name                    = "WORLDSKILLSAUS"
  tags = {
    Name = "demo-002"
  }
  tags_all = {
    Name = "demo-002"
  }
}

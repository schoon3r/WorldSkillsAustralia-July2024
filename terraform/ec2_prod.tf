resource "aws_subnet" "private" {
  count                   = length(var.private_subnet)
  vpc_id                  = aws_vpc.WORLDSKILLSAUS-vpc.id
  cidr_block              = var.private_subnet[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = format("WORLDSKILLSAUS_Pair_%03d", floor(count.index / 2) + 1)
    }
}

resource "aws_instance" "web_server" {
  count         = length(var.private_subnet)
  ami           = "ami-032346ab877c418af" 
  instance_type = "t2.large"
  subnet_id     = aws_subnet.private[count.index].id
  private_ip    = cidrhost(aws_subnet.private[count.index].cidr_block, 10)
  vpc_security_group_ids      = ["sg-052ab755afe0c824e"]
  associate_public_ip_address = true
  key_name                    = "WORLDSKILLSAUS"
  tags = {
    Name = format("WORLDSKILLSAUS_Pair_%03d_web_server", count.index + 1)
  }
}

resource "aws_instance" "vuln_vm" {
  count         = length(var.private_subnet)
  ami           = "ami-032346ab877c418af" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private[count.index].id
  private_ip    = cidrhost(aws_subnet.private[count.index].cidr_block, 100)
  vpc_security_group_ids      = ["sg-052ab755afe0c824e"]
  associate_public_ip_address = true
  key_name                    = "WORLDSKILLSAUS"
  tags = {
    Name = format("WORLDSKILLSAUS_Pair_%03d_VULN_VM", count.index + 1)
  }
}

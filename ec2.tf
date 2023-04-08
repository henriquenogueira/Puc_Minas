resource "aws_instance" "pfsense_firewall" {
  ami           = var.ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.pfsense_firewall_network_interface.id
    device_index         = 0
  }

  tags = {
    Name = "pfsense_firewall"
  }
}

resource "aws_network_interface" "pfsense_firewall_network_interface" {
  subnet_id = aws_subnet.publica_1.id

  tags = {
    Name = "pfsense-firewall"
  }
}
resource "tls_private_key" "ssh_ec2_pfsense" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "servidores"
  public_key = tls_private_key.ssh_ec2_pfsense.public_key_openssh
}

output "private_key" {
  value     = tls_private_key.ssh_ec2_pfsense.private_key_pem
  sensitive = true
}
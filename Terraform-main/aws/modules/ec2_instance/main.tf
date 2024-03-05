resource "aws_instance" "server_1" {
  ami                    = data.aws_ami.ubuntu_latest.id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = file("${path.module}/user_data.sh")
  tags = {
    Name = var.instance_name
    Env  = "Testing"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip #self is mentioned to avoid infinite loop between instance and provisioner.
  }
}

//creating ssh-key pair
resource "aws_key_pair" "tf_key_pair" {
  key_name   = var.key_pair_name
  public_key = file("${path.module}/id_rsa.pub")
}

//To generate ssh key pair in current working directory -
// ssh-keygen
// it will ask where to save, simply put: ./id_rsa

//elastic ip
# resource "aws_eip" "tf_eip" {
#   vpc = true
#   instance_id   = aws_instance.server_1.id
# }
# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.server_1.id
#   allocation_id = aws_eip.tf_eip.id
# }

# resource "aws_key_pair" "test" {
#     key_name   = "${uuid()}"
#     public_key = "${tls_private_key.t.public_key_openssh}"
# }
# provider "tls" {}
# resource "tls_private_key" "t" {
#     algorithm = "RSA"
# }
# provider "local" {}
# resource "local_file" "key" {
#     content  = "${tls_private_key.t.private_key_pem}"
#     filename = "id_rsa"
#     provisioner "local-exec" {
#         command = "chmod 600 id_rsa"
#     }
# }
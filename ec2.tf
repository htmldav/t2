# creating instance
resource "aws_instance" "terraforminstance" {
  ami                         = var.ami_id
#   availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
 
  count                       = var.instance_count
  security_groups             = ["${aws_security_group.ec2-sg16062022.id}"]
#   subnet_id                   = var.subnet_id
  associate_public_ip_address = true
#   ebs_block_device {
#     device_name           = "/dev/xvda"
#     volume_size           = 8
#     volume_type           = "gp2"
#     delete_on_termination = true
#     tags = {
#       Name = "terraform-storage"
#     }
#   }
  tags = var.tags

  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/root/.ssh/id_rsa")
      timeout     = "4m"
   }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC74czLJL3UR1UTJGGLMwKRNrP3W2wfW9uwsTw3q06DflBCI0/jIJfOgHkO3/5UVSEvYnwKkZHG5f9rR/npFSOnqsPdamPhLDCsT9A2D7tJQB/kllSbrTzQMbiZ7NgtB2vEkKw7CJdlkxXbyqLYuFWgnqhRm1iXBtWVLUX9z/Mt0EOgfXqzbBwoJ365dJVpG5LH5E14OTtFOtzgSRkGx1QECCEL2jbT1P0BacdBoO4czvZEK3Jnojs5ZW3V2JgF6xuYNVsgC6L5g5CpFoh9flPar4c8tvOFMpznIUKSBHi6HFkogkNCrC10teAo0VHdAZPfYjcbSLxzQ6W0P7ZkB4cN root@ip-172-31-80-119"
}
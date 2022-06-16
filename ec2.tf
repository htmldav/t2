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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgLuNvutMBKBRcZdvieFIlunRaE6ZfQRNbwQb6rxYxoG5BRf01SGRghZeGYTQ8kh4hDsIt/21QNMcy2m5Mtfz6src1RkAgjrrnaM/N4hHVN/84ju2cJx9apQOdOjS7tqH+1ayxg3bV6hYN0mfHovIWqCb+DCmJaROEguNCkxwFmcADefavH23dvCQ+iRvAMmnso0DCH3XRfB+3C/CTeGNtXQ5SPFVxYFAN41+OQ/EaXHy1d3cgtSFQ7A6eE44k5vWxewxP+1xbj59Zuxxxn2JKYoClAq9bb9amx20jngwoqs4utBZhmaL1q1sZcne/Ufs/CyWakS1NxtBMQ9a97WRJ root@ip-172-31-85-33"
}
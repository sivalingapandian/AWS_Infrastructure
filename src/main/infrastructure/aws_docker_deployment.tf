provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "njugdemoinstance" {
  ami           = "ami-6869aa05"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.allow_all_njug.name}"]
  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      host = "${aws_instance.njugdemoinstance.public_ip}"
      timeout = "5m"
      private_key = "${file("${var.aws_access_key_file_name}")}"
    }
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo docker info",
      "sudo docker run --name ${var.application_name} -p 80:8080 -t ${var.application}"
    ]
  }
}

resource "aws_security_group" "allow_all_njug" {
  name = "allow_all_njug"
  description = "Allow all inbound traffic"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_eip" "ip" {
  instance = "${aws_instance.njugdemoinstance.id}"
}
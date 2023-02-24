terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
provider "aws"{
access_key= "AKIAW456GZ2JAEKD2HGW"
secret_key= "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"
region= "ap-south-1"
}

resource "aws_instance" "Tomcat_conf" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
key_name= "chetan.pem"
vpc_security_group_ids      = ["${aws_security_group.vpc_conf.id}"]
provisioner "file" {
    source      = "conf.sh"
    destination = "conf.sh"
  }
provisioner "remote-exec"  {
    inline  = [
    "sudo yum install -y java",
    "sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz",
    "sudo yum upgrade -y",
    "sudo tar -xf apache-tomcat-9.0.71.tar.gz",
    "sudo sh conf.sh",
    ]
}
connection {
    type         = "ssh"
        host         = self.public_ip
            user         = "ec2-user"
                private_key  = file("/root/jenkins-tomcat-jira-terraform/" )
                   }
  tags = {
    "Name" = "Tomcat_conf"
  }
}


resource "aws_instance" "Jenkins" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
key_name= "aws"
vpc_security_group_ids      = ["${aws_security_group.vpc_conf.id}"]

provisioner "remote-exec"  {
    inline  = [
      "sudo yum install -y jenkins java-11-openjdk-devel",
      "sudo yum -y install java",
      "sudo yum -y install wget",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install jenkins -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "sudo yum install git -y",
      ]
   }

connection {
    type         = "ssh"
        host         = self.public_ip
            user         = "ec2-user"
                private_key  = file("/root/jenkins-tomcat-jira-terraform/" )
                   }
  tags = {
    "Name" = "Jenkins_conf"
  }
}


resource "aws_instance" "Jira" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.medium"
key_name= "aws"
vpc_security_group_ids      = ["${aws_security_group.vpc_conf.id}"]
provisioner "remote-exec"  {
    inline  = [
      "sudo yum update -y",
      "sudo wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-9.6.0-x64.bin",
      "sudo chmod +x atlassian-jira-software-9.6.0-x64.bin",
   ]
   }
connection {
    type         = "ssh"
        host         = self.public_ip
            user         = "ec2-user"
                private_key  = file("/root/jenkins-tomcat-jira-terraform/" )
                   }
  tags = {
    "Name" = "Jira_conf"
  }
}


     
   

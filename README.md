# jenkins-tomcat-jira-terraform
1.Create a instance (aws linux, t2.medium)
2.connect to the instance (Mobaxterm)
3.install terraform
	sudo yum install -y yum-utils shadow-utils
	sudo yum-config-manager --add-repo 	https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
	sudo yum -y install terraform
4.Install git
	yum install git -y
5.Clone the git repository
6.Create a .pem file and add the aws instance security key text and save it
7.open the terraform.tf file
	vi Terraform_script.tf
		add your aws access key and security key
		add your key name (in tomcat_conf)
		add your path of the key pair which is created in the same instance.
	vi sg.tf
		add your
8.Terraform 
	terraform init
	terraform plan
	terraform apply
-------------------------------	
TOMCAT

9.connect to Tomcat instance through the mobaxtream
	sudo su
	navigate inside tomcat bin folder and start it (sh startup.sh)

10.By using tomcat instance public ipv4:8080 connect in the broswer
11.click on manager apps (user name=admin :: password=admin)

-------------------------------
JIRA
12.Connect to instancein mobaxtream
13.complete the installation
14.jira ipv4:8080 connect in broswer and setup the account
15.create a scrum project
-------------------------------
JENKINS
16.connect to the instance in mobaxterm
17.sudo su
18.cat /var/lib/jenkins/secrets/initialAdminPassword
19.By using Jenkins instance public ipv4:8080 connect in the broswer (setup the jenkins)
20.add a "jira" and "deploy to container" plugin to jenkins
21.add MAVEN in global tool configuration
22.add jira url and credentials in configure system
23.create a free style project 
24.add git hub url
25.Build Step-----invoke top level maven target----select maven----add life cycle (clean install)
26.Post build actions---deploy to container----select tomcat 9.0---add tomcat url and credentials
27.Post build actions---create jira issue---add 
28.Click on build now


	

sudo sed -i '56 i\<role rolename="manager-gui"/>' /home/ec2-user/apache-tomcat-9.0.71/conf/tomcat-users.xml
sudo sed -i '57 i\<role rolename="manager-script"/>' /home/ec2-user/apache-tomcat-9.0.71/conf/tomcat-users.xml
sudo sed -i '58 i\<role rolename="manager-jmx"/>' /home/ec2-user/apache-tomcat-9.0.71/conf/tomcat-users.xml
sudo sed -i '59 i\<role rolename="manager-status"/>' /home/ec2-user/apache-tomcat-9.0.71/conf/tomcat-users.xml
sudo sed -i '60 i\<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx,manager-status"/>' /home/ec2-user/apache-tomcat-9.0.71/conf/tomcat-users.xml
sudo sed -i '19,1 i\<!--' /home/ec2-user/apache-tomcat-9.0.71/webapps/manager/META-INF/context.xml
sudo sed -i '24,1 i\-->' /home/ec2-user/apache-tomcat-9.0.71/webapps/manager/META-INF/context.xml


#!/bin/bash
# Use this script to install tomcat in rehat servers
sudo rm -rf /opt/tomcat9
sudo rm -rf /opt/tomcat
echo assign a hostname to your server 
sudo hostnamectl set-hostname tomcat
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.
sudo yum install wget unzip -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.88/bin/apache-tomcat-8.5.88.tar.gz
sudo tar -xvf apache-tomcat-8.5.88.tar.gz
sudo rm apache-tomcat-8.5.88.tar.gz
sudo mv apache-tomcat-8.5.88 tomcat
sudo chmod 777 -R /opt/tomcat
sudo chown ec2-user -R /opt/tomcat
sh /opt/tomcat/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
sudo su - ec2-user
starttomcat
#========

#2. Start of tomcat configuration 


#Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat9/conf/server.xml
vi /opt/tomcat9/webapps/manager/META-INF/context.xml
vi /opt/tomcat9/conf/tomcat-user.xml  # to add user

	<user username="landmark" password="admin" roles="manager-gui,admin-gui"/>
	

/opt/tomcat9/conf/context.xml

 vi /opt/tomcat9/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat9/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	

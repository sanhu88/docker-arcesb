# docker-arcesb
Docker file for ArcESB™ Connet(aka RssBus before)

[简体中文](./README.md) | English | [DockerHub](https://hub.docker.com/r/xiaojia/arcesb)

## Explanation

1. This is not the official maintained version, [official website link](https://www.arcesb.com/)
2. ArcESB is paid software and requires a license key to use. It have try license after installation
3. The login and password is saved in[tomcat-users.xml](./tomcat/conf/tomcat-users.xml)

## Usage

1. Generate an image based on [Dockerfile](. /Dockerfile)

   ~~~bash
   docker build -t xiaojia/arcesb:20.0.7681 .
   ~~~

   Or pull from Docker Hub

   ~~~bash
   docker pull xiaojia/arcesb:20.0.7681
   ~~~

   

2. Running the container for the first time

   ~~~bash
   docker run -itd --name arcesb -p 8888:8080  xiaojia/arcesb:20.0.7681
   ~~~

3. Copy the configuration file in the container to the host

   ~~~bash
   docker cp arcesb:/usr/local/tomcat/conf/ /Your/Host/Path/Save/conf
   ~~~

4. Delete the container 

   ~~~bash
   docker rm -f arcesb
   ~~~

5. Mount the configuration file and run the container a second time

   ~~~bash
   docker run -itd --name arcesb -p 8888:8080 -v /root/rssbu/xiaojia/tomcat/conf/:/usr/local/tomcat/conf/ -v /root/rssbu/xiaojia/tomcat/logs:/usr/local/tomcat/logs -v /root/rssbu/xiaojia/arcesb:/root/arcesb xiaojia/arcesb:20.0.7681
   ~~~

6. Add web page login account (please replace the name and password values)

   ~~~bash
   nano /Your/Host/Path/Save/conf/tomcat-users.xml
   
   ...
   	<user name="YourLoginAccount" password="YourPassWordxxxx" roles="arcesb_admin,admin-gui,manager-gui,manager-status,manager-script,manager-jmx" />
   </tomcat-users>
   ~~~

7. Browser and login

   ~~~
   https://Your IP or Your Domain:8888
   ~~~

## Note

1. Tomcat's conf cannot use the volume parameter to synchronize to the host on the first run. The method or nice docker command are not found yet. If you know the solution, please submit an issue.
2. The DOWNLOAD_URL for [Dockerfile](. /Dockerfile) of DOWNLOAD_URL is obtained in March 2021, and the possibility of official changes in the future cannot be ruled out. [Official Download](https://www.arcesb.com/download/)
3. For more details, please refer to the official manual. When using in production environment, please evaluate carefully and at your own risk.


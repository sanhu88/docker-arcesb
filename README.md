# docker-arcesb
Docker file for ArcESB™ Connet(aka RssBus before)

简体中文 | [English](./README.en-WW.md) | [DockerHub](https://hub.docker.com/r/xiaojia/arcesb)

## 说明

1. 这不是官方维护的版本，[官网链接](https://www.arcesb.com/)
2. ArcESB 是收费软件，使用需要授权秘钥。安装后试用体验
3. 登录密码保存在[tomcat-users.xml](./tomcat/conf/tomcat-users.xml)

## 使用方法

1. 根据[Dockerfile](./Dockerfile)生成镜像

   ~~~bash
   docker build -t xiaojia/arcesb:20.0.7681 .
   ~~~

   或者 在Docker Hub 拉取

   ~~~bash
   docker pull xiaojia/arcesb:20.0.7681
   ~~~

2. 第一次运行容器

   ~~~bash
   docker run -itd --name arcesb -p 8888:8080  xiaojia/arcesb:20.0.7681
   ~~~

3. 复制容器内配置文件到宿主机

   ~~~bash
   docker cp arcesb:/usr/local/tomcat/conf/ /Your/Host/Path/Save/tomcat/conf
   ~~~

4. 删除容器

   ~~~bash
   docker rm -f arcesb
   ~~~

5. 挂载配置文件，第二次运行容器

   ~~~bash
   docker run -itd --name arcesb -p 8888:8080 -v /Your/Host/Path/Save/tomcat/conf/:/usr/local/tomcat/conf/ -v /Your/Host/Path/Save/tomcat/logs:/usr/local/tomcat/logs -v /Your/Host/Path/Save/arcesb:/root/arcesb xiaojia/arcesb:20.0.7681
   ~~~

6. 添加登录账号(请替换name和password的值)

   ~~~bash
   nano /Your/Host/Path/Save/tomcat/conf/tomcat-users.xml
   
   ...
   	<user name="YourLoginAccount" password="YourPassWordxxxx" roles="arcesb_admin,admin-gui,manager-gui,manager-status,manager-script,manager-jmx" />
   </tomcat-users>
   ~~~

7. 浏览器访问登录

   ~~~
   https://Your IP or Your Domain:8888
   ~~~

## 问题

1. tomcat的conf无法在第一次run时，就可以使用volume参数同步到宿主机。暂时没找到方法和优雅的docker 命令，如果您知道解决方法，欢迎提交issue。
2. [Dockerfile](./Dockerfile) 的DOWNLOAD_URL是2021年3月获取，不排除未来官方变更的可能性。[官方下载](https://www.arcesb.com/download/)
3. 更多细节参考官方手册，生产环境使用时，请仔细评估并自担风险


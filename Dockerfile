FROM tomcat:9.0

# 下载安装包
ENV DOWNLOAD_URL https://www.arcesb.com/download/getfile.aspx?file=free/AZYF-V/setup.zip&name=ArcESB%202020&go=true
ADD $DOWNLOAD_URL /tmp/ArcESB2020.zip

# 安装到ROOT目录，删除文件
RUN rm -rf /usr/local/tomcat/webapps/ROOT && cd /tmp/ && unzip ArcESB2020.zip && cp arcesb.war /usr/local/tomcat/webapps/ROOT.war && rm -rf /tmp/*
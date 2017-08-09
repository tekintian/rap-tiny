############################################################
# 带ssh的centos
# Based on Centos 6.8
#
############################################################
# Set the base image to centos6.8
FROM centos:6.8

# File Author / Maintainer
MAINTAINER lvyalin lvyalin.yl@gmail.com

##################### 常用基础软件 START #####################
RUN yum install -y vsftpd vim wget crontabs gcc make openssh-server git unzip && \
 service sshd start && echo "root:Root1.pwd" | chpasswd &&  yum clean all
##################### 常用基础软件 END #####################

##################### 安装java-1.8.0-openjdk-headless #########
RUN yum install -y java-1.8.0-openjdk && \
 yum install -y java-1.8.0-openjdk-devel.x86_64
##################### 安装java-1.8.0-openjdk-headless end #####

###################### redis START #####################
COPY conf/redis/redis /etc/init.d/redis
COPY conf/redis/redis.conf /etc/redis.conf
RUN chmod +x /etc/init.d/redis && cd /usr/src && \
 wget http://download.redis.io/releases/redis-3.2.9.tar.gz && tar xzf redis-3.2.9.tar.gz && cd redis-3.2.9 && make && \
 cp src/redis-server /usr/sbin/redis-server && cp src/redis-cli /usr/sbin/redis-cli && \
 rm -rf /usr/src/redis-3.2.9.tar.gz
###################### redis END #####################

###################### mysql START #####################
RUN rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm && \
 yum -y install mysql-community-server && \
 service mysqld start && \
 defaultmysqlpwd=`grep 'A temporary password' /var/log/mysqld.log | awk -F"root@localhost: " '{ print $2}' ` && \
 /usr/bin/mysql -uroot -p${defaultmysqlpwd} --connect-expired-password -e "SET PASSWORD = PASSWORD('Root1.pwd');grant all privileges on *.* to root@'%' identified by 'Root1.pwd';" && \
 yum clean all
###################### mysql END #####################

###################### mvn ############################
RUN wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.zip && \
 unzip apache-maven-3.5.0-bin.zip && \
 mv apache-maven-3.5.0 /opt/maven

ENV MAVEN_HOME=/opt/maven
ENV PATH=${MAVEN_HOME}/bin:${PATH}
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
ENV PATH=$JAVA_HOME/bin:${PATH}

COPY conf/maven/settings.xml /opt/maven/conf/settings.xml
#######################################################

COPY rc.local /etc/rc.local
RUN chmod +x /etc/rc.local
CMD ["/etc/rc.local"]
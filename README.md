## RAP介绍

RAP是一个由阿里提供的可视化接口管理开源工具。通过分析接口结构，动态生成模拟数据，校验真实接口正确性， 围绕接口定义，通过一系列自动化工具提升我们的协作效率。

[RAP主页传送门](http://rapapi.org/org/index.do)

## 镜像说明

rap docker without mysql container

本镜像基于centos6.8,并增加了如下服务，并且默认开机启动。

> * redis 3.2.3
> * jdk-headless 1.8
> * tomcat 8.5.20

tomcat安装位置为`/usr/local/tomcat8`

rap_tiny
rap_tiny
RapYN888888

在安装之后需要自己导入创建数据库
https://bitbucket.org/tekintian/rap/raw/0c6da1f0316d8d02baf9decf37e8ab381933f5fb/ROOT/WEB-INF/classes/database/initialize.sql

登录容器并配置容器中的数据库连接/usr/local/tomcat8/webapps/ROOT/WEB-INF/classes/config.properties

docker run --name rap-tiny -itd -p 808:80 -v /rap-tiny:/data tekintian/rap:tiny

## 如何使用

1. 首先创建容器：`docker run -itd -p 8080:80 --name rap-tiny tekintian/rap-tiny`

    8080 为主机端口,如果8080被占用,则更换一个端口
    
   > 如果需要修改rap的mysql配置，修改配置文件
   /usr/local/tomcat8/webapps/ROOT/WEB-INF/classes/config.properties中的配置即可

2. 本地构建访问：http://127.0.0.1 ，完成。

   > 容器的启动大概需要10s左右初始化数据的时间，可以通过docker logs -f rap查看容器启动情况
   >
   > 如果需要修改admin密码，请参考官方方法：[Admin初始密码是什么？]
   https://github.com/thx/RAP/wiki/deploy_manual_cn






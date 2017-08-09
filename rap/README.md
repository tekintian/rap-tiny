## RAP介绍

RAP是一个由阿里提供的可视化接口管理开源工具。通过分析接口结构，动态生成模拟数据，校验真实接口正确性， 围绕接口定义，通过一系列自动化工具提升我们的协作效率。

[RAP主页传送门](http://rapapi.org/org/index.do)

## 镜像说明

本镜像基于centos6.8,并增加了如下服务，并且默认开机启动。

> * sshd
> * mysql 5.7.17
> * redis 3.2.3
> * jdk-headless 1.8
> * tomcat 8.5.16

tomcat安装位置为`usr/local/apache-tomcat-8.5.16`

mysql默认账号为：`root`，默认密码为：`Root1.pwd`

ssh默认root登陆密码为`Root1.pwd`



## 如何使用

1. 首先创建容器：`docker run -itd -p 80:80 --name rap ifintech/rap`

   > 如果需要修改rap的mysql配置，修改配置文件usr/local/apache-tomcat-8.5.16/webapps/ROOT/WEB-INF/classes/config.properties中的配置即可

2. 本地构建访问：http://127.0.0.1 ，完成。

   > 容器的启动大概需要10s左右初始化数据的时间，可以通过docker logs -f rap查看容器启动情况
   >
   > 如果需要修改admin密码，请参考官方方法：[Admin初始密码是什么？](https://github.com/thx/RAP/wiki/deploy_manual_cn)


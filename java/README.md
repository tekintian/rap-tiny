# 说明
本镜像基于centos6.8,并增加了如下服务
> * sshd
> * mysql 5.7.17
> * redis 3.2.3
> * jdk-headless 1.8
> * maven

并且默认开机启动

默认root密码为`Root1.pwd`。  
默认mysql密码为`Root1.pwd`。  


# 官方地址
https://hub.docker.com/r/ifintech/java/

### 创建容器
此命令只作为示例
```bash
docker run -itd --name java_test -p 80:80 ifintech/java
```

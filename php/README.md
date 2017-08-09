# 说明
> 为开发使用的一体化镜像类虚拟机

本镜像基于centos6.8,并增加了如下服务
> * sshd
> * openresty 1.11.2.2
> * php 7.1.2
> * mysql 5.7.17
> * redis 3.2.3

并且默认开机启动

默认root密码为`Root1.pwd`。  
默认mysql密码为`Root1.pwd`。  

## 构建
在当前目录执行
```
docker build -t gitlab.nw.com:4567/dockerhub/php/image .

docker push gitlab.nw.com:4567/dockerhub/php/image
```

### 创建容器
此命令只作为示例
```bash
docker run -itd --name test gitlab.nw.com:4567/dockerhub/php/image
```

### docker hub

> https://hub.docker.com/r/ifintech/php7/

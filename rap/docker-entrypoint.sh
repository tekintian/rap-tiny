#!/bin/bash

# 启动sshd服务
service sshd start && echo "root:Root1.pwd" | chpasswd

# 判断是否为第一次启动mysql服务，如果是并修改mysql root密码，如果不是则只启动mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then
    service mysqld start
    defaultmysqlpwd=`grep 'A temporary password' /var/log/mysqld.log | awk -F"root@localhost: " '{ print $2}' `
    /usr/bin/mysql -uroot -p${defaultmysqlpwd} --connect-expired-password -e "SET PASSWORD = PASSWORD('Root1.pwd');grant all privileges on *.* to root@'%' identified by 'Root1.pwd';"
else
    service mysqld start
fi

# 启动redis
/etc/init.d/redis start

# 启动tomcat
/usr/local/apache-tomcat-8.5.16/bin/startup.sh

# 判断是否有rap数据库文件，如果没有则进行数据初始化操作
if [ ! -d "/var/lib/mysql/rap_db" ]; then
    echo "部署war包中......"
    sleep 5
    if [ ! -f "/usr/local/apache-tomcat-8.5.16/webapps/ROOT/WEB-INF/classes/database/initialize.sql" ]; then
        echo "error : war包部署失败!"
        exit;
    fi
    echo "初始化数据......."
    mysql -h127.0.0.1 -uroot -pRoot1.pwd -e "source /usr/local/apache-tomcat-8.5.16/webapps/ROOT/WEB-INF/classes/database/initialize.sql;"
    echo "修改mysql配置......"
    sed -i 's/jdbc.password=/jdbc.password =Root1.pwd/g' /usr/local/apache-tomcat-8.5.16/webapps/ROOT/WEB-INF/classes/config.properties
    # 重启tomcat
    /usr/local/apache-tomcat-8.5.16/bin/shutdown.sh
    /usr/local/apache-tomcat-8.5.16/bin/startup.sh
fi

exec "$@"
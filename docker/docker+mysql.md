启动mysql的docker镜像
```
docker pull mysql:latest
docker run -itd --name mysql-test -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
docker exec -it mysql-test bash
mysql -u root -p 
ALTER USER 'root'@'localhost' IDENTIFIED BY 'yourpassword';

# 为了用navicat链接。可以选择修改root用户为可以远程链接，也可以新建用户
CREATE USER '新用户'@'%' IDENTIFIED WITH mysql_native_password BY '新密码';
GRANT ALL PRIVILEGES ON *.* TO '新用户'@'%';
```
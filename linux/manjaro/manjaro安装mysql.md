1. sudo pacman -S mysql

这里安装了8.0.21版本的

2. mysql初始化
```
mysqld --initialize --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```
这里会生成一个初始密码，需要记录

3. 查看mysql状态
```
sudo systemctl status mysqld
```
4. 开机自启动
```
sudo systemctl enable mysqld
```
5. 启动
```
sudo systemctl start mysqld
```
6. 修改初始密码
```
mysql -u root -p
ALTER USER "root"@"localhost" IDENTIFIED BY "root密码";
```

7. 工具
可以直接在add/remove softwore搜索dbeaver安装
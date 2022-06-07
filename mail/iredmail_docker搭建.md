1. 安装docker
2. sudo docker search iredmail
3. sudo docker pull iredmail/mariadb:stable
4. 也可以在docker官方网站查看https://hub.docker.com/r/iredmail/mariadb
5. 按照docker官网的方法进行部署，注意项目文件目录修改成自己想要的
6. 然后可以https://127.0.0.1/iredadmin,后台管理网站，可以进行用户的添加
7. http://127.0.0.1,邮箱账户登录
8. 由于我只要收邮件，所以端口和ewomail一样就行，dns配置也一样就行
9. 数据库和管理后台的密码都是自己设置的密码
9. 域默认邮箱的设置，别名邮箱的设置，还有域与域之间的邮件转发，多域名设置，可以看官方文档，注意看英文的，中文的不少没有翻译，官方文档https://docs.iredmail.org/





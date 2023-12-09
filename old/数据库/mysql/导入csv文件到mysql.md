1. 准备工作
```
# 打开local_infile 在mysql交互命令行中
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = true;

# 查看secure_file_priv文件夹 只有这个文件夹中的文件才能上传
SHOW variables like '%secure%' ;
```
2. 进行上传 sql 上传
```
# fields terminated by ',' 指每行中的每个字段以',' 分隔
# ENCLOSED BY '"' 每个字段 是否被 '"' 括起来
# LINES TERMINATED BY ‘\r\n’  每一行的结尾
# IGNORE 1 LINES 忽略第一行的表头
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/user_info_utf.csv' into table userinfo fields terminated by ',' ENCLOSED BY '' LINES TERMINATED BY ‘\r\n’ IGNORE 1 LINES;
```
3. 可以在导入时转换数据，比如时间的转换
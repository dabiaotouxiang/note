1. mysql -u root -p 进入数据库
2. show variables like '%sort_buffer_size%';  看下 ‘sort_buffer_size’ 到底有多少
3. SET GLOBAL sort_buffer_size = 1024*1024;  #等号后面要改的  选择自己需求的大小
4. 如果运行mysql命令还是 报 Out of sort memory, consider increasing server sort buffer size 请自己考虑 增加第3步的大小
5. 上面是紧急情况下的解决办法，最好还是详细看一下自己的SQL语句的问题。一般是SQL语句没有优化导致的
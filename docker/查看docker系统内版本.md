1. cat /etc/issue
2. cat /proc/version 或 uname -a ，这样查到的是宿主机的系统。
3. 因为docker并不能隔离像/dev、/proc的目录，这些都是直接挂载的宿主机的。所以，很多命令像free top之类的命令，其实看到的都是宿主机的。因为这些命令都是基于/proc下的信息统计出来的
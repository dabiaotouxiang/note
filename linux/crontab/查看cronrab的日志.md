查看crontab的日志记录

1. linux
看/var/log/cron这个文件就可以

2. unix
在/var/spool/cron/tmp文件中，有croutXXX001864的tmp文件，tail这些文件就可以看到正在执行的任务了。

3. mail任务
在/var/spool/mail/root文件中，有crontab执行文件的记录，用tail -f /var/spool/mail/root即可查看最近的crontab执行情况。

原文在此: https://www.centos.bz/2017/08/view-crontab-log-locate-issue/
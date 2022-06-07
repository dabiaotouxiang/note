1. pip install gunicorn
2. gunicorn启动命令
```
gunicorn -w 3 -b 127.0.0.1:8000 project_name.wsgi:application
```
3. supervisor 安装
```
sudo apt install supervisor
```
配置文件目录在`/etc/supervisor/`

自定义的配置文件在`/etc/supervisor/conf.d/`

启动用
```
sudo supervisord
```

supervisor.conf模板，随用随加
```
[program:test_django]
directory=/home/lsb/django_test/test_demo
command=/home/lsb/django_test/env/bin/gunicorn -w 3 -b 127.0.0.1:8000 test_demo.wsgi:application
autostart=true
autorestart=true
startretries=10
redirect_stderr=true
stdout_logfile=/home/lsb/django_test/test_demo/supervisor.log
```
4. nginx
```
server {
    listen 80;
    server_name 192.168.135.3;
    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

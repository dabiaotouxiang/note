1. 宿主机安装docker
2. docker search gitlab
3. docker pull gitlab/gitlab-ce
4. run_docker_gitlab.sh
```
sudo docker run \
    -itd \
    -p 9980:80 \
    -p 9922:22 \
    -v /home/docker/gitlab/etc:/etc/gitlab \
    -v /home/docker/gitlab/logs:/var/log/gitlab \
    -v /home/docker/gitlab/opt:/var/opt/gitlab \
    --restart always \
    --privileged=true \
    --name gitlab \
    gitlab/gitlab-ce
```
5. stop_gitlab.sh
```
sudo docker stop gitlab
sudo docker rm gitlab
```
6. 进入gitlab
```
sudo docker exec -it gitlab bash
```
7. 修改配置文件
```
vim /etc/gitlab/gitlab.rb
```
添加
```
external_url 'http://ip:9980'
这里是宿主机的ip，另外也可以写域名，https
```
```
nginx['listen_port'] = 80
默认会在external_url里面获取端口，所以这里写明
```
```
gitlab_rails['gitlab_ssh_host'] = ip
gitlab_rails['gitlab_shell_ssh_port'] = 9922
```
8. 刷新配置
```
gitlab-ctl reconfigure
gitlab-ctl restart
```

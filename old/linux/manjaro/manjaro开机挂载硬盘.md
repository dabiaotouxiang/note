1. 针对普通用户，ext4格式，且挂载的目录只针对一个用户，不太具有普适性，适合只有一个普通用户的情况
2. sudo fdisk -l 找到要挂载的硬盘 下面以/dev/sda为例
3. sudo fdisk /dev/sda
4. d 删除所有的分区
5. n 创建一个主分区
6. t 为分区标识为linux filesystem
7. w 保存退出
8. sudo mkfs.ext4 /dev/sda1
9. 在用户目录下新建一个文件夹，名字随意，我起名叫data
10. sudo mount /dev/sda1 ~/data。
11. sudo chown 用户名:用户组 ~/data
11. 为了实现开机挂载，找到sda1的uuid `ll /dev/disk/by-uuid/`
12. sudo vim /etc/fstab 添加
`UUID=要挂载的分区的UUID /home/xxx/data ext4 defaults,noatime 0 1`
13. 这样就可以了
14. 如果这样设置完了重启出现lightdm启动失败的情况，按住fn+alt+f2进行命令行登录，然后`sudo systemctl start lightdm`。然后取消上面的所有操作
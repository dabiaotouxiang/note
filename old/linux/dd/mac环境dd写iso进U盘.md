1. iso转换为dmg
```
sudo hdiutil convert -format UDRW -o /linux.dmg kali.iso
```
2. 查看U盘盘符
```
diskutil list
```
3. 取消挂载
```
diskutil umountDisk /dev/disk2
```
4. 写入
5. sudo dd if=源路径 of=/dev/r卷标 bs=1m ［‘r’ 会让命令执行加快一点］ ［‘bs’为一次填充的容量］
```
sudo dd if=/linux.dmg of=/dev/rdisk2 bs=1m
```
6. 弹出U盘
diskutil eject /dev/disk2
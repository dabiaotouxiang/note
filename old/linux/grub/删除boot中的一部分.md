作死装了双系统，发现windows系统没啥用，就直接格式化了硬盘，发现bios里面还是有boot残留，操作系统是ubuntu

```
sudo efibootmgr
```
会出现类似的信息
```
BootCurrent: 0002
Timeout: 2 seconds
BootOrder: 0002,0001,000
Boot0000* Dell
Boot0001* Windows Boot Manager
Boot0002* ubuntu
```

想删除windows，就输入下面的命令
```
sudo efibootmgr -b 1 -B
```
1就是指的序号

```
sudo ls /boot/efi/EFI
```
会出现下面的信息
```
Dell Windows ubuntu
```
然后
```
sudo rm -r /boot/efi/EFI/Windows
```

更新grub
```
sudo update-grub
```
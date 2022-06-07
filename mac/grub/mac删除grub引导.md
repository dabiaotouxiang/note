上周闲着没事在mac上安装了manjaro系统，同时还保存了macos，后来由于无线网卡的驱动弄不明白，就把manjaro的磁盘空间格式化了。

这周末电脑没电了，充电重启后进入了grub rescue模式，鼓捣了半天，下面记一下解决办法。

<!-- more -->

1. 打开电脑，发现进入grub rescue模式，这时候不要在rescue的命令行做任何事，如果你像我一样把linux已经删掉了的话。
2. 强行重启，疯狂按option，选择macos的盘，启动，就可以正常进入macos系统了
3. 彻底删除grub引导，进入terminal，
  ```bash
  sudo su
  mkdir /mnt
  sudo mount -t msdos /dev/disk0s1 /mnt
  ```
4. finder 前往根目录，删除EFI磁盘下的EFI文件夹
5. 重启，发现可以了，直接进入macos了。
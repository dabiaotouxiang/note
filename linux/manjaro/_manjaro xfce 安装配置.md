## manjaro xfce 安装配置

1. sudo pacman-mirrors -i -c China -m rank
  选择上海交大的
2. sudo gedit /etc/pacman.conf
  ```
  [archlinuxcn]
  SigLevel = Optional TrustedOnly
  Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux-cn/$arch
  ```
3. sudo pacman -Syyu
4. sudo pacman -S archlinuxcn-keyring
5. sudo pacman -S yay
6. yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
6. sudo pacman -S vim 
7. sudo pacman -S netease-cloud-music
8. sudo pacman -Sy base-devel
9. sudo pacman -S fcitx fcitx-qt5 libidn11 lsb-release opencc qt5-declarative qt5-svg xorg-xprop fcitx-configtool 
10. yay -s fcitx-sogoupinyin
  ```
  sudo vim /etc/environment
  GTK_IM_MODULE=fcitx
  QT_IM_MODULE=fcitx
  XMODIFIERS=@im=fcitx
  ```
11. 如果遇到上述方法无效的情况，那么再尝试在~/.xprofile或者~/.xinitrc中添加以上代码，造成不同的原因可能是硬件或系统的细微差异所致。应评论区要求，笔者又详细测试了在其他文件中添加环境变量的效果，结论是在本人电脑（manjaro+xfce）上只有environment添加变量有效，其他位置无效。而其他要求在每个程序目录都加环境变量的，不推荐这样做。
12. sudo pacman -S google-chrome
13. sudo pacman -S clang make cmake gdb
14. yay -s wps-office
15. sudo pacman -S  ttf-wps-fonts
16. ll的配置
  ```bash
  vim ~/.bashrc
  ```
  添加
  ```bash
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'
  ```
  保存退出之后
  ```bash
  source ~/.bashrc
  ```
17. net-tools
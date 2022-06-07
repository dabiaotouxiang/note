1. sudo pacman -S deepin deepin-extra
2. 修改 /etc/lightdm/lightdm.conf
```
sudo cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bak

sudo sed -i 's/greeter-session=lightdm-.*/greeter-session=lightdm-deepin-greeter/g' /etc/lightdm/lightdm.conf

sudo sed -i 's/user-session=xfce/user-session=deepin/g'  /etc/lightdm/lightdm.conf
```
3. 重启，右下角选择桌面环境
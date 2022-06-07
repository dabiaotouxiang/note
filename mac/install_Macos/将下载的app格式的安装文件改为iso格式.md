# 此处用High Seirra演示
1. `hdiutil create -o /tmp/macOS -size 12945m -volname macOS -layout SPUD -fs HFS+J` 在tmp目录下新建一个12945M的空白磁盘
2. `hdiutil attach /tmp/macOS.dmg -noverify -mountpoint /Volumes/macOS` 挂载创建的磁盘
3. `sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/macOS --nointeraction` 想磁盘中写入数据，和制作启动盘一样
4. `hdiutil detach -force /Volumes/Install\ macOS\ High\ Sierra` 弹出写好的数据
5. `hdiutil convert /tmp/macOS.dmg -format UDTO -o ~/Downloads/macOS-High-Sierra`把刚刚推出的dmg镜像文件转换成DVD/CD-R存储格式的镜像文件
6. `mv ~/Downloads/macOS-High-Sierra.cdr ~/Downloads/macOS-High-Sierra.iso`把前面做好的系统盘转换成DVD/CD-R格式(文件后缀为`.cdr`，可以认为是macOS版的`.iso`
7. `rm -f /tmp/macOS.dmg` 删除最开始创建的macOS.dmg
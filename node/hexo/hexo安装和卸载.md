1. 我使用的是centos7服务器

2. 建议看<https://hexo.io/docs/index.html>而不是搜索出来的中文文档，太老了
<!-- more -->
3. 安装git

   ```bash
   sudo yum install git
   ```

4. 安装node.js

   * 一开始输入以下命令

     ```bash
     curl -sL https://rpm.nodesource.com/setup_13.x | bash -
     ```

     出现警告，  

     >Your distribution, identified as "centos-release-7-7.1908.0.el7.centos.x86_64", is not currently supported  

   * 于是用了低一个版本的

     ```bash
     curl -sL https://rpm.nodesource.com/setup_12.x | bash -
     ```

     看到出现提示

     >\#\# Run sudo yum install -y nodejs to install Node.js 12.x and npm.
     >
     >\#\# You may also need development tools to build native addons:
     >
     >​		 sudo yum install gcc-c++ make
     >
     >\#\# To install the Yarn package manager, run:
     >
     >​          curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo sudo yum install yarn

   * 然后按照指示输入

     ```bash
     sudo yum install -y nodejs
     ```

   * 安装完成

5. 安装Hexo

   * 输入以下指令

     ```bash
     sudo npm install -g hexo-cli
     ```

     在网上查了一下hexo-cli好像说是hexo的命令行模式

   * 输入以下指令查验

     ```bash
     hexo --version
     ```

6. 卸载Hexo

   * 输入以下指令

     ```bash
     sudo npm uninstall hexo-cli -g
     ```
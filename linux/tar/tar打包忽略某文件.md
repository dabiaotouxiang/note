打包代码的时候经常会把env文件一起打包，占地方，打包也慢，tar命令可以忽略打包文件夹下的某个文件，文件夹

<!--more-->


以项目test为例，test目录下有一个文件夹env，我们想把test文件夹打包，同时忽略env文件夹
```bash
tar -zcvf test.tar.gz --exclude=test/env test
```
如果还想排除其他目标，再加--exclude即可，比如我们还想忽略.idea文件
```bash
tar -zcvf test.tar.gz --exclude=test/env --exclude=test/.idea test
```

打包命令
```bash
tar -cvf test.tar test
# 压缩命令
gzip test.tar
```
#把/temp/目录直接打包压缩为".tar.gz"格式，通过"-z"来识别格式，"-cvf"和打包选项一致
```
tar -zcvf tmp.tar.gz /tmp/
```
###注意
`test/env`后面不可以再加`/`，比如写成`test/env/`就不行，tar就不会忽略env目录
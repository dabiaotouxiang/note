方法一： 

选择压缩包保存路径：$ cd yourPath
1. 只压缩单个文件

zip -e yourZipFileName.zip yourSourceFile

回车 ，分别输入密码（回车）和确认密码（回车）就OK了。

2. 压缩文件夹

zip -e -r yourZipFileName.zip yourSourceFileDir

其余同上。(-r 表示将文件夹中所有的文件进行压缩)

方法二：可以通过一行命令搞定

zip -r -p yourPassword yourZipFileName.zip yourSourceFileDir
回车就OK了，但是这种方法只输入一次密码，万一压缩时输错密码，再想打开可就悲剧了
周一的时候我的一个服务崩了，怎一个惨字了得，在年中的时候，为了方便运营们用系统，我搞了一个倒入导出流程的服务。然后周一晚上十二点钟的时候，运营同志连续导入120个流程，然后就崩了，什么数据都获取不到。

查后台的日志，发现是这么一个错误
`exception: QueuePool limit of size 5 overflow 10 reached, connection timed out, timeout 30 (Background on this error at: http://sqlalche.me/e/3o7r`

这个大概的意思就是你设定的池子大小已经达到了，没有多余的session让你用了，等了30秒也没有，所以获取不到任何数据了。

通过情景复现，发现运营同志是一个一个的导入的，这就很奇怪了，按理说一个一个来的话，session应该是会被释放的。

这就肯定是代码有问题了，最容易想到的就是一次服务用了多个session，并且没有正常关闭。

通过查资料，看源码，找到了问题，在flask_sqlalchemy中，一个实例的保存，官网给出的演示为`db.session.add()`。而db.session的实现为`self.create_scoped_session(session_options)`，每次都会新选择一个session，这样的话，每次新导入一个流程，都要用好几个session，最后close的时候也只close了一次，造成大量的session只能随着时间自动关闭。

后来使用`db_session = db.session`，每次服务都只选择一次，然后始终只用`db_session`，修改后进行了测试，连续导入120个流程，并没有崩溃。

flask_sqlalchemy的配置：
参阅http://www.pythondoc.com/flask-sqlalchemy/config.html

**对于数据库查询来说，最好一次查出所有，然后使用内存中的数据，尽量减少内存的访问**
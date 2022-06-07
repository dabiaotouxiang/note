## 设置环境变量，屏蔽提示（推荐直接配置Google API key）
打开 windows 的 cmd 命令提示符，依次输入以下命令：
```
setx GOOGLE_API_KEY "no"
setx GOOGLE_DEFAULT_CLIENT_ID "no"
setx GOOGLE_DEFAULT_CLIENT_SECRET "no"
```
如果你不需要登陆 Google 账号，仅仅是因为提示烦人，那么执行上面三个命令，就能满足你的需求，想要登陆 Google 账号的话，就需要配置 Google API Key

可以去申请google api key
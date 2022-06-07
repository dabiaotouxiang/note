### 最简单的方法
项目根目录
```
cnpm install --save @types/node
```
尝试，不行重启vscode

该方法不行，再尝试下面的。

### 步骤多一些的方法
1. 安装typings这个包
```
npm install -g typings
或者是
cnpm i typings -g
cnpm下载会快一点
```
下载完成后输入
```
typings --version 
```
出现版本号说明成功

2. 在项目中配置代码补全
打开项目根目录，输入
```
typings init
```
然后根目录下面就会出现一个typings.json文件，这是typings的配置文件。然后输入如下命令
```
node提示
typings install dt~node --global --save
express提示
typings install dt~express --global
```

3. 可能出现的情况
```
国内的greatwall屏蔽了git，造成文件下载失败
node:39632) UnhandledPromiseRejectionWarning: PopsicleError: Unable to connect to "https://raw.githubusercontent.com/DefinitelyTyped/DefinitelyTyped/a4a912a0cd1849fa7df0e5d909c8625fba04e49d/node/index.d.ts"
    at Request.error (/Users/edz/git/nvm/versions/node/v8.12.0/lib/node_modules/typings/node_modules/_popsicle@9.2.0@popsicle/dist/request.js:41:16)
    at ClientRequest.<anonymous> (/Users/edz/git/nvm/versions/node/v8.12.0/lib/node_modules/typings/node_modules/_popsicle@9.2.0@popsicle/dist/index.js:131:39)
    at emitOne (events.js:121:20)
    at ClientRequest.emit (events.js:211:7)
    at TLSSocket.socketErrorListener (_http_client.js:387:9)
    at emitOne (events.js:116:13)
    at TLSSocket.emit (events.js:211:7)
    at emitErrorNT (internal/streams/destroy.js:66:8)
    at _combinedTickCallback (internal/process/next_tick.js:139:11)
    at process._tickCallback (internal/process/next_tick.js:181:9)
(node:39632) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without
```
解决办法，我用了一个笨方法，我的电脑是mac，原来配置过wireguard，直接打开wireguard，再下载就可以了。

ssr的话，由于ssr只是监控浏览器的流量，对于命令行并没有监控，好像可以进行配置，但我没有试过。
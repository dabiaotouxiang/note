前几天遇到一个下载音频的问题，本来以为应该很简单的，没想到遇上了跨域，前端同事让我帮他写一个代理转接一下。

一开始打算在Django写的，但是由于需要下载音频的服务与Django服务不在同一个端口，而a标签的download属性需要ip和端口都一样

没办法，只好硬着头皮在egg后端服务上添加了一个接口（毕竟我node很不熟）。

还好这个比较简单，egg提供的封装也很好用，很简单的就完成了。

下面是crontroller里的代码
```
'use strict';

const Controller = require('egg').Controller;
const Helper = {};

class ProxyController extends Controller {
  async audio() {
    const { ctx, app, service } = this;
    const audio_path = ctx.query.audio_src;
    const result = await ctx.curl(audio_path);
    const audio_data = result.data;
    ctx.status = 200;
    // body的内容就是response的body
    ctx.body = audio_data;
    ctx.set('content-type', 'audio/mpeg');
  }
}

module.exports = ProxyController;
```

直接将获取的音频的数据传回了前端
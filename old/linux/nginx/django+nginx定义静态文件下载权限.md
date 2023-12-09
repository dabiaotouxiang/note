对nginx代理的静态文件进行权限保护，或者是根据用户的不同下载不同的文件，或者是想在下载前做一些操作

<!--more-->
### nginx配置
```
location /protected_files {
            internal;    # 重点
            alias 要保护的文件的目录;
        }
```
* internal指的是Nginx的内部命令，意思是只有内部请求才能使用的，外部请求返回404
这时候如果用/protected_file/文件名去访问的话，就会发现报404

### django配置

* 我设置的文件下载的路由是/staticfiles/文件编码，该文件编码作为缓存中的key存在，30秒后消失，即30秒后该链接失效，无法从缓存中获取正确的文件名

```python
import json
from urllib.parse import quote
import logging
from django.core.cache import cache
from django.http import HttpResponse

logger = logging.getLogger(__name__)

def get_file_name(request, code):
    filename = cache.get(code, None)
    if filename is None:
        return HttpResponse(json.dumps({"code": -1, "msg": "未找到该文件，请刷新后重试"}), content_type="application/json")
    response = HttpResponse()
    response['Content-Type'] = 'application/octet-stream'
    response["Content-Disposition"] = "attachment; filename={0}".format(quote(filename, 'utf-8'))
    response['X-Accel-Redirect'] = '/protected_files/%s' % quote(filename, 'utf-8')
    logger.info(response.serialize_headers())
    return response
```

该链接指向get_file_name方法，通过文件编码获取文件名，并加入返回头里。

**注意**
* Content-Type 必须有，不然浏览器不会自动下载文件，会在浏览器端展示文件内容
* Content-Disposition 中的filename 与X-Accel-Redirect 中的filename如果是中文的话，必须经过quote转化为url编码，不然找不到文件，或者下载文件后，文件名是乱码
* X-Accel-Redirect 主要的作用就是告诉nginx，nginx要把该请求重定向到/protected_files/XXX链接。

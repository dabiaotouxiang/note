有时候请求中会出现这样的字符：
```
=?utf-8?b?L3Byb3RlY3RlZF9maWxlcy/lkJXkuJblrp0xMHJlc3VsdC54bHN4?=
```
这是由于utf-8编码的中文无法自动转换为url编码
用以下python3代码可以对中文进行转化
```python
from urllib.parse import quote
quote('测试', 'utf-8')
```
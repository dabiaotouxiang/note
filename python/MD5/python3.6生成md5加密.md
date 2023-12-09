代码如下
```python
import hashlib
hashlib.md5(SMS_PASSWORD.encode('utf-8')).hexdigest()
```
注意md5加密有的需要大写，有的需要小写  
python生成的是小写，可以用.upper()进行大小写转换
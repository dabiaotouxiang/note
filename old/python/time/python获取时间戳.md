1. 十位时间戳 单位秒
```
import time
t = time.time() # 获得带小数的
int(t) # 去掉小数，获得十位时间戳
```

2. 十三位时间戳 毫秒
```
import time
millis = int(round(time.time() * 1000))
```

3. 十三位时间戳转时间
```
import time
now = int(round(time.time()*1000))
now02 = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(now/1000))
```
```python
LANGUAGE_CODE = 'zh-Hans'

TIME_ZONE = 'Asia/Shanghai'

USE_TZ = False
```

这三个都设置了才可以，不然`USE_TZ = True`依然是美时区

检验方法:
`python manage.py shell`

出现交互命令行
输入
```python
from django.utils import timezone
timezone.now()
```
看结果是否是中国时区



### 补充
最近做的一个项目要求系统时间是utc时间，展示时间是local时间
```
TIME_ZONE = 'Asia/Shanghai' 
USE_TZ = True 
```
获取utc时间
```
import datetime 
from django.utils.timezone import utc
utcnow = datetime.datetime.utcnow().replace(tzinfo=utc)
```

获取本地时间
```
import datetime 
datetime.datetime.now()
```
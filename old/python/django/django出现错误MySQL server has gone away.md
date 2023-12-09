1. 第一次出现问题是由于对mysql数据的采集量过大

修改一下mysql的配置即可

2. 由于长时间未进行链接导致的

mysql对于数据连接的时长默认是8小时，长时间未操作，django再次进行数据获取的时候，由于链接已经断开，会报这个错

可以添加配置
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'xxxxxxxx',
        'PASSWORD': '12345678',
        'USER':'root',
        'HOST':'localhost',
        'PORT': 3306,
        'CONN_MAX_AGE': 21600,    # 数据库每个连接断开的时间设置为6小时，数据库默认断开为8小时
        'ATOMIC_REQUESTS': True   # 设置事务处理
    }
}
```
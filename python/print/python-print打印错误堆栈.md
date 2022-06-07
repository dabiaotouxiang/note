1. 直接打印
```
try:
    print(1/0)
except Exception as e:
    print(str(e))
```
一般打印一句出错的原因

2. tracebask打印
```
import traceback
try:
    2/0
except Exception as e:
    traceback.print_exc()
```
打印整个错误堆栈

还可以用traceback.format_exc()返回字符串，可将错误信息保存在文档日志中

可以说traceback.print_exc()等同于print traceback.format_exc()
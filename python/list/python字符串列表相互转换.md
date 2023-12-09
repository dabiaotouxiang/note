1. list 转字符串  注意list中的元素必须是字符串
```
list1 = [1, 2, 3, 4]
','.join(list1) # 报错
','.join([str(i) for i in list1])# 不报错
```

2. 字符串转数组，split方法
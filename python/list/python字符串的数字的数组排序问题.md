```
list1 = ['1','2','3','4','11','12','1322','33','44']
list1.sort()
list1
```
结果:['1', '11', '12', '1322', '2', '3', '33', '4', '44']

可以转成int格式再进行排序

```
def sort_key(elem):
    return int(elem)
list1.sort()
list1
```
结果:['1', '2', '3', '4', '11', '12', '33', '44', '1322']
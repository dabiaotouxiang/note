有个需求要往数据库里面写入百万条数据

model如下
```
class Name(models.Model):
    name = models.CharField(max_length=32, verbose_name="名称")
    sex = models.CharField(max_length=32, verbose_name="性别")
```

写入的代码，每次写入1000条
```
name_models = list()
i = 0
for name_sex in name_sex_lists:
    name = Name()
    name.name = name_sex["name"]
    name.sex = name_sex["sex"]
    name_models.append(name)
    i = i + 1
    if (i % 1000) == 0 or ((i % 1000) != 0 and len(name_sex_lists) == i):
        Name.objects.bulk_create(name_models)
        name_models = list()
```
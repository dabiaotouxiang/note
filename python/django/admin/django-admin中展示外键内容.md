如何在list_display和list_filter中添加外键的内容  
# 基于django2.2.7
<!-- more -->
网上好多的教程都提供了两种方法，双下划线和函数，我测试了一下发现双下划线只适用于list_filter，函数只适用于list_display  
## models代码如下
```python
class Author(models.Model):
    name = models.CharField(max_length=255)


class Book(models.Model):
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    title = models.CharField(max_length=255)
```
## admin 代码如下
```python
@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('name',)


@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('author_name', 'title',)
    list_filter = ('author__name',)

    def author_name(self, obj):
        return obj.author.name

    # author_name.admin_order_field = 'author_name'
    author_name.short_description = '作者'
```
尝试了一下在list_display中使用双下划线，会报错  
将author_name写入list_filter也会报错

* short_description 定义的内容为admin页面展示的列名
* admin_order_field 定义的是排序方式，可以加'-'，代表反序
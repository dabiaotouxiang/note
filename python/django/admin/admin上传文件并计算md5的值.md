```
import hashlib
from functools import partial
def md5(data, block_size=65536):
    # 创建md5对象
    m = hashlib.md5()
    # 对django中的文件对象进行迭代
    for item in iter(partial(data.read, block_size), b''):
        # 把迭代后的bytes加入到md5对象中
        m.update(item)
    str_md5 = m.hexdigest()
    return str_md5
    
@admin.register(Test)
class TestAdmin(admin.ModelAdmin):
    list_display = ("Test", )

    # book是filefield
    fields = (
        "book", )

    def save_model(self, request, obj, form, change):
        # 获取文件流，并计算md5值保存
        io_buffer_file = request._files.get("book").file
        file_md5 = md5(io_buffer_file)
        if Test.objects.filter(hashcode=file_md5).exists():
            test = Test.objects.filter(hashcode=file_md5).first()
            messages.error(request, '该文件已经存在名称为' + Test.book.name)
            messages.set_level(request, messages.ERROR)
            return None
        else:
            obj.hashcode = file_md5
        super().save_model(request, obj, form, change)
```
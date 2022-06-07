新的一个小项目中遇到一个问题，上传文件的问题，由于我俩都比较迷，文件的上传搞得比较迷。完全没有标准可言了
<!--more-->
处理的过程大概是，前端读取文件，并将文件名和文件的内容传递给我。

然后传给我的文件内容是带格式标注的base64编码，就是下面这种，前面是base64编码，后面是一堆base64的编码。
```
1.txt     data:text/plain;base64,

2.doc     data:application/msword;base64,

3.docx    data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,

4.xls     data:application/vnd.ms-excel;base64,

5.xlsx    data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,

6.pdf     data:application/pdf;base64,

7.pptx    data:application/vnd.openxmlformats-officedocument.presentationml.presentation;base64,

8.ppt     data:application/vnd.ms-powerpoint;base64,


图片

1.png     data:image/png;base64,

2.jpg     data:image/jpeg;base64,

3.gif     data:image/gif;base64,

4.svg     data:image/svg+xml;base64,

5.ico     data:image/x-icon;base64,

6.bmp     data:image/bmp;base64,

```

上传的文件分为csv和xlsx

其中csv比较好处理, call_file是前端传过来的原始的数据:
```python
import base64
call_file = call_file.replace('data:text/csv;base64,', '')
file_data = base64.b64decode(call_file, '-_')
# base64编码直接转一下就可以写进文件了，注意转了之后是二进制
with open(BASE_DIR + '/static/' + filename + '.csv', 'wb') as f:
    f.write(file_data)
```

xlsx的难处理一点，由于我的后台都是csv文件的处理，所以我把它转成csv格式
```python
call_file = call_file.replace('data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,', '')
file_data = base64.b64decode(call_file, '-_')
from openpyxl import load_workbook
from io import BytesIO
import csv
workbook = load_workbook(filename=BytesIO(file_data))
table = workbook.get_sheet_by_name(workbook.get_sheet_names()[0])
with open(BASE_DIR + '/static/' + filename + '.csv', 'w') as f:
    write = csv.writer(f)
    for row in table.rows:
        row_container = []
        for cell in row:
            row_container.append(str(cell.value))
        write.writerow(row_container)
```

#### 其中各种文件用JS转Base64之后的data类型转自 https://blog.csdn.net/liu911025/article/details/88716767

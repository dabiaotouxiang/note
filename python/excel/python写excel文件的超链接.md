一般的excel操作，可以在网上搜到一大堆，这里主要写一个超链接的问题，我在网上找到的python生成excel超链接的操作有两种。
1. 第一种：xlwt写公式的方式
```python
import xlwt

wb = xlwt.Workbook()
ws = wb.add_sheet('test')

ws.write(0, 0, xlwt.Formula('"test" & HYPERLINK("http://google.com")'))

wb.save('test.xls')
```
这种写法在用手机打开时，有可能会无法点击链接跳转。
2. 第二种: xlsxwriter直接写
```python
import xlsxwriter

workbook = xlsxwriter.Workbook("file.xlsx")
worksheet1 = workbook.add_worksheet()
worksheet1.write_url('A1', 'http://www.python.org/')
# excel从00开始计数
worksheet.write_url(0, 0, 'http://www.python.org/', string="python官方")
```
这种写法，手机和电脑均可以点击链接
```
import io
import requests
import openpyxl


def get_xlsx():
    resp = requests.get("https://xxxxx.xlsx")
    file = io.BytesIO(resp.content)
    openpyxl.load_workbook(file)
```
在settings.py文件目录下的__init__.py中添加
```
import  pymysql
pymysql.version_info = (1, 4, 13, "final", 0)
pymysql.install_as_MySQLdb()
```
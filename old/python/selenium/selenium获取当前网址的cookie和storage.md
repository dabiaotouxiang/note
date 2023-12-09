```
cookies = driver.get_cookies()
local_storages = driver.execute_script(
    "var ls = window.localStorage, items = {}; "
    "for (var i = 0, k; i < ls.length; ++i) "
    "  items[k = ls.key(i)] = ls.getItem(k); "
    "return items; ")
session_storages = driver.execute_script(
    "var ls = window.sessionStorage, items = {}; "
    "for (var i = 0, k; i < ls.length; ++i) "
    "  items[k = ls.key(i)] = ls.getItem(k); "
    "return items; ")
```
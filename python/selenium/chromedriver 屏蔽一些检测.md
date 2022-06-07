```
from selenium_stealth import stealth
from selenium.webdriver.chrome.options import Options
chrome_options = Options()
chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
chrome_options.add_experimental_option('useAutomationExtension', False)
driver = webdriver.Chrome(options=chrome_options)
stealth(driver, languages=["zh-hans", "cn"], vendor="Google Inc.", platform="MacIntel", webgl_vendor="ATI Technologies Inc.", renderer="AMD Radeon R9 M390 OpenGL Engine", fix_hairline=True, )
```
其中options是常规配置

stealth会在页面加载时将一些特性屏蔽

还有一步，用vim打开chromedriver，搜索`$cdc_asdjflasutopfhvcZLmcfl_`，然后将cdc进行替换，替换为其他的三个字母，一开始替换为其他的四个字母，发现运行不了，也不能用vscode打开，vscode修改之后再保存会改变文件的格式，打不开。


1. 安装 HTML Snippets插件
2. 安装 HTML CSS Support插件
3. 配置 html 模板
    * mac
        1. 导航栏 code > Preferences > User Snippets
        2. 输入html并选择
        3. 在json里面添加
        ```
        "Print to htmlDOCTYPE": {
		"prefix": "!",
		"body": [
			"<!DOCTYPE html>",
			"<html lang=\"zh\">",
			"<head>",
			"\t<meta charset=\"UTF-8\">",
			"\t<title>Title</title>",
			"</head>",
			"<body>",
			"",
			"</body>",
			"</html>"
		],
		"description": "html"
	    }
        ```
        4. 使用的时候输入!就可以选择模板添加了
4. vscode默认支持emmet
5. 配置浏览器打开 安装 open in browser 插件
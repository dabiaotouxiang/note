1. 安装python插件
2. 设置python的language server为Pylance
3. pymain
    ```json
    "python main": {
    "prefix": "pymain",
    "body": [
            "if __name__ == '__main__':",
            "    print('Hello World!')"
        ]
	},
    ```
1. 会自动生成setter和getter方法
2. setter格式为
    ```
    @property () NSString *name;

    -(id) setName:(id)name{

    }
    ```
3. getter 格式为
    ```
    @property () NSString *name;

    -(id) name{

    }
    ```
4. 可以用与theos的hook
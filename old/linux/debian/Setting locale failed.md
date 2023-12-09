1. ssh连接的时候出现的
2. 错误如下
    ```
    perl: warning: Setting locale failed.
    perl: warning: Please check that your locale settings:
        LANGUAGE = (unset),
        LC_ALL = (unset),
        LANG = "en_US.UTF-8"
    are supported and installed on your system.
    perl: warning: Falling back to the standard locale ("C").
    ```
3. 在/etc/environment添加
    ```
    LC_ALL=en_US.UTF-8
    LANG=en_US.UTF-8
    ```
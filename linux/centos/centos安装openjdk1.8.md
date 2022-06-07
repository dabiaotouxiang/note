1. `yum install java-1.8.0-openjdk  java-1.8.0-openjdk-devel`
2. `vi  /etc/profile`
3. 在profile后面添加
    ```
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.51.x86_64
    export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
    export PATH=$PATH:$JAVA_HOME/bin
    ```
4. `source /etc/profile`
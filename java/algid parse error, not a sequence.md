1. 错误
    ```
    java.security.InvalidKeyException: IOException : algid parse error, not a sequence
    ```
2. 在读取私钥的时候发生
3. 原因，openssl生成的私钥的样式是pkcs1。java中用`import java.security.spec.PKCS8EncodedKeySpec;`去读取就报错了
4. 解决，用openssl对私钥进行处理，转换样式为pkcs8 `openssl pkcs8 -topk8 -inform PEM -in private.pem -outform pem -nocrypt -out pkcs8_private.pem`
5. pkcs1的private的样式开头是这样的
    ```
    -----BEGIN RSA PRIVATE KEY-----
    ```
6. pkcs8的private的开头是这样的
    ```
    -----BEGIN PRIVATE KEY-----
    ```
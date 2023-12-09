在http代码块下面添加
```
http {
    types_hash_max_size 4096;
    server_names_hash_bucket_size 128;
}
```

如果还是有警告，可以修改一下server_names_hash_bucket_size为你计算机的位数的倍数(32/64的倍数)
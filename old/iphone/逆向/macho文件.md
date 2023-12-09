# 查看架构
`file Mach-o`

# 拆分架构并重新打包
```
lipo Mach-o -thin arm64 -output  MachO-name
zip -ry xxx.ipa Payload // 先把得到的瘦身成功的macho替换Payload里面原来的
```

# 查看加密状态
`otool -l Mach-O | grep cry`
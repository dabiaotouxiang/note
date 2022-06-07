# B跳转汇编
```
b.le ..... // le 小于等于，符合小于等于的就跳转到标号，否则就顺序执行
b.gt ..... // 大于 
b.ge ..... // 大于等于
b.eq ..... // 等于
b.hi ..... // 无符号大于
```

# if
```
cmp w0, w1 // 做一个减法，影响cpsr
b.le ..... // le 小于等于，符合小于等于的就跳转到标号，否则就顺序执行
```

# 循环
## do while
```
cmp ....
b.le ....
```

## while 和 for
```
aaaa: .......
      cmp ......... // 先判断
      b.gt bbbbbbb  // 符合gt条件跳出
      .......... // 不符合就顺序执行
      b aaaaaa // 最后跳到 aaaa
bbbbbb: ......
```

## switch
比较麻烦，因为这个switch中使用查表来提高效率

```
ldrsw x10, [x8, x9, lsl #2]  // x8的地址加上x9向左偏移两位得到的地址存储的值赋值给x10
```

### switch的效率
1. 分枝少的时候，没必要用，汇编相当于if
2. 分枝常量差值较大的时候，编译器会在效率还是内存取舍，会编译成if...else的结构
3. 分支比较多的时候会生成速查表

## xcode编译器优化
xcode的Building Settings里的Optimizational Level选择优化的级别
今天在写笔记的时候发现记录C语言的库时，尖括号里的东西显示不出来，后来查资料发现是由于markdown为了兼容html，将尖括号默认识别成了标签，加反斜杠也没用

可以选择加\`\`进行显示，比如下面这样
```
`<stdio.h>`
``` 

也可以用转义字符，左尖括号写`&lt;`，右尖括号写`&gt;`
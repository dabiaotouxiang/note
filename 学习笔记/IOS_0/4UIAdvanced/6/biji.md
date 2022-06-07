1. 图形上下文栈
    1. 将当前图形上下文的绘图状态信息保存到栈中，绘图信息是线宽，颜色之类的 `void CGContextSaveGState(CGContextRefc)`
    2. 将栈顶的“绘图次态” 出栈，替换找当前的 “图形上下文”中的“绘图状态” `void CGContextRestoreGState(CGContextRefc)`
2. Quartz2D的内存管理
    1. CGPathRelease(path)； 释放path
    2. CFRelease(path); 基本所有的CG的都可以释放
3. product->analyze 分析可以指出需要修改的地方，比如说释放内存之类的
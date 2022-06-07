1. 找到调用的方法![](./fishHook1.png)
2. _rebind_symbols_for_image方法 ![](./fishHook2.png)
3. rebind_symbols_for_image方法 遍历macho文件，找到懒加载表和非懒加载表 ![](./fishHook3-1.png)![](./fishHook3-2.png)
4. perform_rebinding_with_section ![](./fishHook.png)

fishHook的效率并不高
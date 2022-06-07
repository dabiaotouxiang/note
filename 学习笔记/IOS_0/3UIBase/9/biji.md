1. button
    1. 设置居中`button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;`
    2. 设置左侧的空的大小 `button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);`
    3. 设置title的左侧的空的大小 `button.titleEdgeInsets =UIEdgeInsetsMake(0, 5, 0, 0);`
    4. 设置图片旋转后不拉伸 
        ```
        // 不拉伸
        button.imageView.contentMode = UIViewContentModeCenter;
        // 不剪切
        button.imageView.clipsToBounds = NO;
        ```
2. 获取当前主window
    ```
    // 获取后添加了一个label
    [[[UIApplication sharedApplication] keyWindow] addSubview:label];
    ```
3. 对于cell可以在storyboard中设置reusableId，然后就可以通过id获取这个cell来作为模板
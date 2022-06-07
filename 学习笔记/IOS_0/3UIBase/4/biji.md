1. 设置启动图片
    1. 在target的general的App Icons and Launch Images 中把 launch ScreenFile 后面的空的值删掉
    2. 在asserts文件夹,右键选择 iOS-->iOS Launch Image
    3. 把图片放进去
    4. Targets-->Build Setting 搜索Launch，把Asset Catalog Launch Image Set Name的值设置为刚刚创建的 LaunchImage
    5. 最后把LaunchScreen.storyboard 的 Use as Launch Screen和Use Safe Area Layout Guides 取消选中
    6. 如果设置好了没有显示启动图，就把APP删除掉重新安装就好了
2. 或者直接在LaunchScreen.storyboard里面拉imageView
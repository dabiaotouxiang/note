1. 启动图片与控制器大小
    1. 如果用assert中的launchImg来作为启动图片。那么启动图片的大小会影响后面控制器的大小
2. KVC
    1. `[self setValuesForKeysWithDictionary:dict];` 直接根据属性名喝dict里的key给对象赋值
    2. `[self.groups valueForKeyPath:@"title"];` 一个对象数组，取出每个对象的title并组成一个array返回
3. 右侧的index索引
    1. 实现UITableViewDelegate的方法 `sectionIndexTitlesForTableView`
4. 监听cell的点击
    1. 实现UITableViewDelegate的方法 `didSelectRowAtIndexPath`被选中
    2. 实现UITableViewDelegate的方法 `didDeselectRowAtIndexPath`取消选中
5. 刷新数据
    1. `self.tableView reloadRowsAtIndexPaths:  withRowAnimation:UITableViewRowAnimationAutomatic`刷新指定位置的数据，并指定动画样式
    2. `self.tableView reloadData` 刷新所有
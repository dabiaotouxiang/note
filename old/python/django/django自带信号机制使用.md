最近要在项目上加一个同步缓存的功能，一开始想用django-admin重写save_model，后来偶然发现django自带的信号机制，可以更好地完成这项工作。

该信号机制为同步，不可以当做异步来使用，如果做耗时比较久的处理建议还是用celery。

下面对信号机制做一下介绍，仅介绍model signals。
<!-- more -->

django自带了一个信号机制，当系统完成某个动作的时候，会自动的发送一些信息，这些信息可以被接收者接收。方便解耦的程序之间进行相互调用。

下面介绍一下django内建的信号，并以其中一个为例，介绍一下如何使用（**翻译自django文档2.2**）

## Model signals(用django的orm进行增删改查时)
**model signals的引用`from django.db.models.signals import`**
1. pre_init
  * 当你新建一个model的实例时，实例的init方法开始时，会发出信号
  * 随信号发送如下参数
    * sender 该实例属于哪个类
	* args 传递到__init__的位置参数列表
	* kwargs 传递到__init__的关键字参数列表
2. post_init
  * 当init方法结束时，会发出信号
  * 随信号发送如下参数
    * sender 该实例属于哪个类
	* instance 刚创建的实例
3. pre_save
  * save方法刚开始时
  * 随信号发送如下参数
    * sender model的class
	* instance 将要保存的实例
	* raw 一个布尔值，查看源码发现，当raw为False的时候，会保存父对象模型，默认为False。
	* using 应用的数据库表别名
	* update_fields 如果该动作为更新，传递更新的内容，如果不是就为None
4. post_save
  * 当save方法结束时
  * 随信号发送如下参数
    * sender model的class
	* instance 刚保存的实例
	* created 如果是True的话，save方法被用于创建，为False的话，save方法被用于更新
	* raw 一个布尔值，查看源码发现，当raw为False的时候，会保存父对象模型，
默认为False。
	* using 应用的数据库表别名
	* update_fields 如果该动作为更新，传递更新的内容，如果不是就为None
5. pre_delete
  * 当model或者queryset的delete方法开始时
  * 随信号发送下列参数
    * sender model的class
	* instance 将被删除的实例
	* using 应用的数据库表别名
6. post_delete
  * 当model或者queryset的delete方法结束时
  * 随信号发送如下参数
    * sender model的class
	* instance 被删除的实例，注意该实例已经不在数据库中了
	* using 应用的数据库表别名
7. m2m_changed
  * 当多对多关系发生改变时
  * 随信号发送如下参数
    * sender 多对多模型的中间类，该类在创建多对多模型时自动创建，可以在数据库表中看到，也可以用through去访问该类
	* instance 更新多对多关系的实例，可以是sender的实例，也可以是多对多关系相关类的实例
	* action 一个描述该多对多关系更新内容的字符串，可以是以下之一
	  1. pre_add 在一个或者多个实例被加入多对多关系之前
	  2. post_add 在一个或者多个实例被加入多对多关系之后
	  3. pre_remove 在从关系中删除一个或者多个对象之前发送
	  4. post_remove 从关系中删除一个或者多个对象后发送
	  5. pre_clear 关系解除前发送
	  6. post_clear 关系清除后发送
	* reverse 描述哪一侧的关系被更新(正向，反向)
	* model 从关系中被清除的，添加的，移除的实例的类
	* pk_set 
	  1. 对于pre_add和post_add动作，这是将要或者已经添加到关系中的一组主键值。注意过滤关系中的现有值
	  2. 对于pre_remove和post_remove动作。将要或者已经被删除的主键值
	  3. 对于pre_clear和post_clear动作，这是None
	* using 正在使用的数据库别名

## post_save的使用
  1. 首先在app中创建自己的信号接收者，我的目录是`myapp/utils/cache.py`

  ```python
    from django.db.models.signals import post_save
    from django.dispatch import receiver
    from dm.models import Flow
    
    @receiver(post_save, sender=Flow)
    def set_flow_cache(sender, instance, **kwargs):
        print("信号被接收")
  ```
  2. 将自己的signal的接受者加入app的config，使其能在django启动时被加载目录为`myapp/apps.py`

  ```python
    from django.apps import AppConfig

    class MyAppConfig(AppConfig):
        name = 'myapp'

        def ready(self):
            # signals are imported, so that they are defined and can be used
            import myapp.utils.cache
  ```
  目录为`myapp/__init__.py`
  ```python
	  default_app_config = 'myapp.apps.MyAppConfig'
  ```

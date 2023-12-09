当采用客户端象django的服务器提交post请求时。会得到403，权限异常。


因为django针对提交的请教，有校验。所以会如此。

解决办法http://stackoverflow.com/questions/6800894/django-returns-403-error-when-sending-a-post-request


导入模块

from django.views.decorators.csrf import csrf_exempt
在函数前面添加修饰器

@csrf_exempt


```

#客户端提交的post如果不加这段，会出现403error
@csrf_exempt
def api_blogs(request):
    if request.method == 'POST' and request.POST['page']:
        int_page = int(request.POST['page'])
    else:
        int_page = 1
 
    blogs = dbBlog.objects.order_by('-created_date').all()
 
    page_size = 10
    after_range_num = 5
    before_range_num = 6
 
    paginator = Paginator(blogs, page_size)
 
    try:
        blogs = paginator.page(int_page)
    except(EmptyPage, InvalidPage, PageNotAnInteger):
        blogs = paginator.page(1)
 
    try:
        return_json = serializers.serialize('json',blogs.object_list)
    except :
        return_json = {
            'status': 1,
            'msg' '提取blog异常'
        }
 
    return HttpResponse(
        return_json
    )
```
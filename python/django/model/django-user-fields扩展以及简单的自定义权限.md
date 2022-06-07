上周做了一个需求，需要对django自带的user进行扩展，并使用自定义的三级权限。在这里写一下  
<!-- more -->
1. 新建app，名称叫users
2. 在models中新建model
```python
from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class User(AbstractUser):
    ROLE_ADMIN = 'ROLE_ADMIN'
    ROLE_SELL_PRO = 'ROLE_SELL_PRO'
    ROLE_NORMAL = 'ROLE_NORMAL'
    ROLE_CHOICES = (
        (ROLE_ADMIN, '管理员'),
        (ROLE_SELL_PRO, '用户主管'),
        (ROLE_NORMAL, '普通用户'),
    )
    created = models.DateTimeField(blank=True, null=True, verbose_name='创建时间')
    modified = models.DateTimeField(blank=True, null=True, verbose_name='修改时间')
    token = models.CharField(max_length=40, null=True, blank=True, verbose_name='用户 token')
    role = models.CharField(choices=ROLE_CHOICES, null=True, max_length=20)
    parent_id = models.IntegerField(blank=True, null=True, verbose_name='父id')
    mobile = models.CharField(max_length=20, null=True, verbose_name='手机号')
    city = models.CharField(max_length=20, blank=True, null=True, verbose_name='城市')
```
3. 在settings.py中添加
```python
AUTH_USER_MODEL = 'users.User'
```
4. django-admin，我还想用原来Django自带的admin管理界面
```python
@admin.register(User)
class CustomUserAdmin(UserAdmin):
    list_display = UserAdmin.list_display + ('city',)
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name', 'email')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff')}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
        (None, {'fields': ('token', 'role', 'mobile', 'city')}),
    )
    add_fieldsets = UserAdmin.add_fieldsets + (
        (None, {'fields': ('token', 'role', 'mobile', 'city')}),
    )

    # def _add_view(self, request, form_url='', extra_context=None):

    def save_model(self, request, obj, form, change):
        obj.old_user_id = get_crm_user_id(obj.token)
        obj.parent_id = request.user.id
        obj.save()
        if obj.role == 'ROLE_ADMIN':
            group = operate_admin_group()
            obj.groups.add(group)
            obj.save()
        if obj.role == 'ROLE_SELL_PRO':
            group = operate_sell_pro_group()
            obj.groups.add(group)
            obj.save()
        if obj.role == 'ROLE_NORMAL':
            group = operate_normal_group()
            obj.groups.add(group)
            obj.save()
        return super(CustomUserAdmin, self).save_model(request, obj, form, change)

    def get_queryset(self, request):
        # if request.user.is_superuser:
        #     return User.objects.filter()
        return User.objects.filter(parent_id=request.user.id)

    # def has_module_permission(self, request):
    #     if request.path == '/admin/login/':
    #         return True
    #     if request.user.role != 'ROLE_NORMAL':
    #         return True
    #     return False

    def formfield_for_choice_field(self, db_field, request, **kwargs):
        if db_field.name == "role":
            choices = (('ROLE_ADMIN', '管理员'), ('ROLE_SELL_PRO', '用户主管'), ('ROLE_NORMAL', '普通用户'),)
            if request.user.role == 'ROLE_ADMIN':
                choices = (('ROLE_SELL_PRO', '用户主管'), ('ROLE_NORMAL', '普通用户'),)
            if request.user.role == 'ROLE_SELL_PRO':
                choices = (('ROLE_NORMAL', '普通用户'),)
            kwargs['choices'] = tuple(choices)
        return super().formfield_for_choice_field(db_field, request, **kwargs)
```
* 其中继承了UserAdmin，并重新定义了field_sets，添加了自己的字段，并且删除了有关permissions的字段。如果不删除的话，在user保存后会直接
进行user权限的赋予，由于关联性，只要用户有创建用户的权限，就可以进行权限的分配，进而获得更高的权限。
* 对于role字段，动态变化，管理员用户可以创建用户主管和普通用户，用户主管只能创建普通用户
* 在保存的时候对role进行判断，通过一下代码进行权限的赋予
```python
def add_permissions(group, clazz):
    content_type = ContentType.objects.get_for_model(clazz)
    permissions = Permission.objects.filter(content_type=content_type)
    for permission in permissions:
        group.permissions.add(permission)
    return group


def operate_admin_group():
    group = Group.objects.filter(name='管理员权限').first()
    if group is not None:
        return group
    else:
        group = Group.objects.create(name='管理员权限')
        add_permissions(group, User)
        add_permissions(group, CallRecord)
        add_permissions(group, CallAvail)
        add_permissions(group, SmsTemplate)
        add_permissions(group, Seat)
        add_permissions(group, SmsDetail)
        return group


def operate_sell_pro_group():
    group = Group.objects.filter(name='用户主管权限').first()
    if group is not None:
        return group
    else:
        group = Group.objects.create(name='用户主管权限')
        add_permissions(group, User)
        add_permissions(group, CallRecord)
        add_permissions(group, CallAvail)
        add_permissions(group, Seat)
        add_permissions(group, SmsDetail)
        return group


def operate_normal_group():
    group = Group.objects.filter(name='普通用户权限').first()
    if group is not None:
        return group
    else:
        group = Group.objects.create(name='普通用户权限')
        add_permissions(group, CallRecord)
        add_permissions(group, CallAvail)
        add_permissions(group, Seat)
        add_permissions(group, SmsDetail)
        return group
```
由于时间太紧，只有一天多一点的时间，就只能先这么做了，幸好只是一个简单的demo，以后如果自己设计user类的话，还是要深思熟虑

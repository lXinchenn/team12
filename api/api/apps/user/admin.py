from django.contrib import admin
from .models import User

# 自定义后台登录界面标题
admin.AdminSite.site_header = 'Course selection system'


class StudentAdmin(admin.ModelAdmin):
    # 配置数据空字段显示null
    empty_value_display = 'null'

    # 配置显示哪些字段
    list_display = ['username', 'password']
    # 搜索某个字段
    search_fields = ['username']

    # 分页
    list_per_page = 10


# 讲StudentAdmin类注册到后台系统
admin.site.register(User, StudentAdmin)

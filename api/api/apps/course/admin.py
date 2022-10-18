from django.contrib import admin
from .models import Course, Direction


# Register your models here.

class CourseAdmin(admin.ModelAdmin):
    empty_value_display = 'null'

    # 配置显示哪些字段
    list_display = ['course_id', 'course_name', 'Prerequisite', 'Restriction']
    # 搜索某个字段
    search_fields = ['course_id']
    # 过滤某个字段
    list_filter = ['major']

    # 分页
    list_per_page = 20


admin.site.register(Course, CourseAdmin)


class DirectionAdmin(admin.ModelAdmin):
    empty_value_display = 'null'

    # 配置显示哪些字段
    list_display = ['major', 'path', 'course']
    # 搜索某个字段
    search_fields = ['path']
    # 过滤某个字段
    list_filter = ['major']

    # 分页
    list_per_page = 15


admin.site.register(Direction, DirectionAdmin)

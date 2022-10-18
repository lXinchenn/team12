from django.db import models


class User(models.Model):
    """
    用户模型
    """
    username = models.CharField(max_length=128, verbose_name="username")
    password = models.CharField(max_length=128, verbose_name="passward")

    class Meta:
        # 定义数据库表名字
        db_table = "user"
        # 定义后台系统菜单名
        verbose_name = "student"
        verbose_name_plural = verbose_name

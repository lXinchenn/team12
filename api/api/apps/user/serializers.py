from rest_framework import serializers
from .models import User


class UserModelSerializer(serializers.ModelSerializer):
    """
    用户信息序列化器
    """

    class Meta:
        model = User
        # 定义过滤器通过User表的全部字段
        fields = '__all__'

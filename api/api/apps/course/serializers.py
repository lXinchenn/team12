from rest_framework import serializers
from .models import Course, Direction


class CourseModelSerializer(serializers.ModelSerializer):
    """
    课程信息序列化器
    """

    class Meta:
        model = Course
        fields = '__all__'


class CourseMajorSerializer(serializers.ModelSerializer):
    """
    课程专业信息序列化器
    """

    class Meta:
        model = Course
        # 定义过滤器只通过Course表的major字段
        fields = ["major"]


class DirectionModelSerializer(serializers.ModelSerializer):
    """
    专业方向信息序列化器
    """

    class Meta:
        model = Direction
        fields = '__all__'

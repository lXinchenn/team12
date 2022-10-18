from django.db import models


# Create your models here.
class Course(models.Model):
    """
    课程列表
    """
    major = models.CharField(max_length=255, null=True, blank=True, verbose_name="Major")
    course_id = models.CharField(max_length=255, null=True, blank=True, verbose_name="Course_ID")
    course_name = models.CharField(max_length=255, null=True, blank=True, verbose_name="Course_name")
    course_number = models.CharField(max_length=1024, null=True, blank=True, verbose_name="Full_name")
    Prerequisite = models.CharField(max_length=512, null=True, blank=True, verbose_name="Prerequisite")
    Restriction = models.CharField(max_length=255, null=True, blank=True, verbose_name="Restriction")

    class Meta:
        db_table = "course"
        verbose_name = "course_table"
        verbose_name_plural = verbose_name


class Direction(models.Model):
    """
    专业方向模型
    """
    major = models.CharField(max_length=255, null=True, blank=True, verbose_name="Major")
    path = models.CharField(max_length=255, null=True, blank=True, verbose_name="Path")
    course = models.CharField(max_length=1024, null=True, blank=True, verbose_name="Course")

    class Meta:
        db_table = "direction"
        verbose_name = "path_table"
        verbose_name_plural = verbose_name

from django.urls import path
from . import views

urlpatterns = [
    # 定义必修课程显示子路由
    path('info/', views.CourseListAPIView.as_view()),
    # 定义选修课程显示子路由
    path('info/many/', views.CourseManyListAPIView.as_view()),
    # 定义提交学生选择的课程子路由
    path('submit/', views.SubmitAPIView.as_view()),
    # 定义依据专业筛选方向子路由
    path('direction/', views.DirectionAPIView.as_view()),
    # 定义依据方向筛选课程子路由
    path('direction/course/', views.DirectionCourseAPIView.as_view()),
    # 定义专业选择显示子路由
    path('major/', views.CourseMajorListAPIView.as_view()),
    # 定义选课报告生成子路由
    path('pdf/', views.PdfGenerateAPIView.as_view()),
    # 定义课程简介显示子路由
    path('handle/', views.HandleAPIView.as_view()),
    # 定义处理课程互斥课程子路由
    path('conflict/', views.ConflictAPIView.as_view())
]

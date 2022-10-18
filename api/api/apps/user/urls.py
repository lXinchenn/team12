from django.urls import path
from . import views

urlpatterns = [
    # 定义用户登录子路由
    path(r"login/", views.LoginAPIView.as_view()),
]

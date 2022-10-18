from rest_framework.response import Response
from rest_framework.views import APIView
from .models import User
from rest_framework import status


# Create your views here.
class LoginAPIView(APIView):
    """
    登录视图
    """

    def post(self, request):
        # 判断账号或密码是否为空，任意一个为空则执行except下的响应信息
        try:
            # 接收前端传回来的账号密码
            username = request.data.get('username')
            password = request.data.get('password')
        except ValueError:
            return Response({'msg': '登录失败,缺少参数'}, status=status.HTTP_507_INSUFFICIENT_STORAGE)
        # 当账号密码都不为空时，继续从这里开始执行
        # 根据前端传回来的账号去数据库中找到唯一的与之一样账号的用户
        user = User.objects.filter(username=username)
        # 判断前端传回来的密码是否与数据库拿出来的用户密码一致， 若一致则返回成功响应，若不一样则返回失败响应
        if user.values()[0]['password'] == password:
            # 成功响应
            return Response({'msg': '登录成功', 'data': user.values()[0]}, status=status.HTTP_200_OK)
        else:
            # 失败响应
            return Response({'msg': '登录失败'}, status=status.HTTP_400_BAD_REQUEST)

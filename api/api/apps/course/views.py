from django.db.models import Q
from reportlab.lib.styles import ParagraphStyle
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Course, Direction
from .serializers import CourseModelSerializer, CourseMajorSerializer
from random import choice
import io
from django.http import FileResponse
import numpy as np

from reportlab.lib import colors
from reportlab.platypus import Table, Paragraph
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfgen.canvas import Canvas
from datetime import datetime
from api.settings import dev
import os
import random


class CourseListAPIView(ListAPIView):
    """
    课程视图
    """

    def get_queryset(self):
        # 接收前端传回的name参数
        key = self.request.GET.dict()["name"]
        # 判断传回的专业是双专业还是单专业
        if len(key.split(',')) != 1:
            # 双专业则去数据库查找拥有这两个专业的课程数据
            queryset = Course.objects.filter(Q(major=key.split(',')[0]) | Q(major=key.split(',')[1]))
        else:
            # 单专业则去数据库查找拥有这个专业的课程数据
            queryset = Course.objects.filter(major=key)
        # 将在数据库拿到的数据返回给ListAPIView方法来处理
        return queryset

    serializer_class = CourseModelSerializer


class CourseManyListAPIView(ListAPIView):
    """
    课程(选修)视图
    """

    def get_queryset(self):
        key = self.request.GET.dict()["name"]
        # 将数据库里课程表的所有major取出来并做去重处理，形成一个major列表
        majors = Course.objects.values('major').distinct()
        m = []
        # 遍历major列表，将学生选的major剔除掉，剩下的major就是选修课程的
        for i in majors:
            if i["major"] in key.split(','):
                continue
            else:
                m.append(i["major"])
        # 去数据库课程表里拿取选修major列表里的课程
        queryset = Course.objects.filter(major__in=m)
        return queryset

    serializer_class = CourseModelSerializer


class CourseMajorListAPIView(ListAPIView):
    """
    课程视图
    """
    # 获取去重后的major，用于前端选择专业的页面渲染数据
    queryset = Course.objects.values('major').distinct()
    serializer_class = CourseMajorSerializer


class PdfGenerateAPIView(APIView):
    """
    报告生成视图
    """

    def post(self, request):
        # 获取前端传来的info,major,direction,points数据
        info = request.data.get('data')
        major = request.data.get('major')
        direction = request.data.get('direction')
        points = request.data.get('points')
        # 遍历学生的选课数据
        for k in info:
            # 如果选课是必修的，就在course_id上加个*
            if k["nature"] == 'compulsory':
                k["course_id"] = k["course_id"] + ' *'
            else:
                continue
        stage1 = ['', '', '', '', '', '', '', '']
        stage2 = ['', '', '', '', '', '', '', '']
        stage3 = ['', '', '', '', '', '', '', '']
        inx1 = -1
        inx2 = -1
        inx3 = -1
        # 处理选课数据的course_id,用与pdf生成时的课程名字换行
        for i in info:
            if i["tag"] == 'year1':
                inx1 += 1
                stage1.insert(inx1, i["course_id"].replace(' ', '\n'))
            elif i["tag"] == 'year2':
                inx2 += 1
                stage2.insert(inx2, i["course_id"].replace(' ', '\n'))
            elif i["tag"] == 'year3':
                inx3 += 1
                stage3.insert(inx3, i["course_id"].replace(' ', '\n'))

        # 注册consolab.ttf字体，后面往pdf上面写东西都用得到
        pdfmetrics.registerFont(TTFont('console', os.path.join(dev.BASE_DIR, "static/consolab.ttf")))
        # Create a file-like buffer to receive PDF data.
        buffer = io.BytesIO()

        # Create the PDF object, using the buffer as its "file."
        p = Canvas(buffer)

        # Draw things on the PDF. Here's where the PDF generation happens.
        # See the ReportLab documentation for the full list of functionality.
        p.saveState()

        # 设置pdf的画布大小
        p.setPageSize((700, 500))

        # 为pdf配置header颜色条
        header = Table([['']], style={
            ('BACKGROUND', (0, 0), (0, 0), colors.blue),
        })
        header.argH[0] = 40
        header.argW[0] = 650
        header.wrapOn(p, 0, 0)
        header.drawOn(p, 25, 450)

        # 为pdf配置居中标题
        # 设置填充色
        p.setFillColor(colors.skyblue)
        # 设置字体大小
        p.setFont('console', 20)
        # 绘制居中标题文本
        p.drawCentredString(350, 420, "Course selection Report")

        # 为pdf绘制页脚学校logo和pdf生成的时间
        p.setStrokeColor(colors.dimgrey)
        # 绘制线条
        p.line(564, 55, 685, 55)
        p.line(565, 55, 565, 25)
        p.line(20, 25, 566, 25)

        p.drawImage(os.path.join(dev.BASE_DIR, "static/logo.png"), 570, 10, 112, 40)
        p.setFont('console', 10)
        p.setFillColor(colors.black)
        p.drawString(30, 10, "Generation date: {}".format(datetime.now()))

        # 为pdf配置用于显示major和direction的表格
        data = [["Major", "Path"],
                [major.replace(',', '\n'), direction.replace(',', '\n')]]
        t = Table(data, style={
            # 设置表格字体类型和大小
            ("FONT", (0, 0), (-1, 0), 'console', 15),
            ("FONT", (0, -1), (-1, -1), 'console', 10),
            # 设置表格字体颜色
            ("TEXTCOLOR", (0, 0), (-1, 0), colors.darkblue),
            ("TEXTCOLOR", (0, -1), (-1, -1), colors.black),
            # 设置表格文字位置
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            # 为表格配置内外边框线
            ('INNERGRID', (0, 0), (-1, -1), 0.25, colors.black),
            ('BOX', (0, 0), (-1, -1), 0.25, colors.black)
        })
        # 配置表格的绘制位置
        t.wrapOn(p, 0, 0)
        t.drawOn(p, 40, 360)

        # 为pdf配置信息表格
        titleStyle = ParagraphStyle(
            name="titleStyle",
            fontName='console',
            fontSize=10,
            textColor=colors.black,
            backColor=colors.lightblue,
            borderPadding=(5, 5)
        )
        data1 = [[Paragraph('ID:', titleStyle), Paragraph('Name:', titleStyle)],
                 [Paragraph('Date:', titleStyle), Paragraph('Points: {}'.format(points), titleStyle)]]
        t1 = Table(data1)
        t1.argW[0] = 120
        t1.argW[1] = 100
        t1.wrapOn(p, 0, 0)
        t1.drawOn(p, 465, 365)

        # 为pdf配置课程表
        data2 = [['YEAR\nONE'] + stage1[:8],
                 ['YEAR\nTWO'] + stage2[:8],
                 ['YEAR\nTHREE'] + stage3[:8]]
        t2 = Table(data2, style={
            ("FONT", (0, 0), (0, 2), 'console', 20),
            ("TEXTCOLOR", (0, 0), (0, 2), colors.white),
            ("FONT", (1, 0), (-1, -1), 'console', 14),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            # 为表格配置文字的上下距离
            ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
            # 为表格配置背景颜色
            ('BACKGROUND', (0, 0), (0, 2), colors.blue),
            ('BACKGROUND', (1, 0), (-1, -1), colors.lightblue),
            ('INNERGRID', (0, 0), (-1, -1), 2, colors.white),
            ('BOX', (0, 0), (-1, -1), 0.25, colors.white)
        })
        # 设置表格中每个格子的长宽
        for i in range(3):
            t2.argH[i] = 70
        for i in range(np.max([len(stage1[:8]), len(stage2[:8]), len(stage3[:8])]) + 1):
            t2.argW[i] = 70
        t2.wrapOn(p, 0, 0)
        t2.drawOn(p, 20, 90)

        p.restoreState()
        # Close the PDF object cleanly, and we're done.
        p.showPage()
        p.save()

        # FileResponse sets the Content-Disposition header so that browsers
        # present the option to save the file.
        buffer.seek(0)
        return FileResponse(buffer, as_attachment=True, filename='hello.pdf')


class HandleAPIView(APIView):
    """
    课程简介信息处理视图
    """

    def post(self, request):
        data = request.data.get('msg')
        try:
            if data[-1] is None:
                return Response('')
            else:
                return Response(data[-1])
        except IndexError:
            return Response('')


class ConflictAPIView(APIView):
    """
    互斥课程处理视图
    """

    def post(self, request):
        # 获取前端传来的学生选中的课程信息中的Restriction字段信息
        flag = request.data.get('array')
        sign = []
        # 将字段信息列表中的None值去掉
        for f in flag:
            if f is None:
                continue
            else:
                sign.append(f)
        # 将互斥课程按分隔符拆分成一个个course_id
        res = []
        try:
            for i in sign:
                for j in i.split(','):
                    if '、' in j:
                        for k in [j.lstrip().split(' ')[0] + ' ' + o for o in j.lstrip().split(' ')[-1].split('、')]:
                            res.append(k)
                    else:
                        res.append(j.lstrip())
            # 将处理好的数据返回给前端给课程表格判断是否禁选
            return Response(res)
        except AttributeError:
            return Response(res)


class SubmitAPIView(APIView):
    """
    学生选课提交视图
    """

    def post(self, request):
        # 获取学生提交的必修（msg）和选修（msg1）课程信息
        msg = request.data.get('msg')
        msg1 = request.data.get('msg1')
        stage_lis = ['year1', 'year2', 'year3']
        new_arr = []
        for item in msg:
            # 设置返回给前端的数据默认是非编辑状态
            item["stated"] = 0
            # 为选课结果表格显示配置必修选修
            item["nature"] = 'compulsory'
            # 为选课结果表格必修选修的显示配置底色
            item["type"] = ''
            # 为选课随机分配就读学年
            item["tag"] = random.choice(stage_lis)
            new_arr.append(item)
        for item in msg1:
            item["stated"] = 0
            item["nature"] = 'elective'
            item["type"] = 'success'
            item["tag"] = random.choice(stage_lis)
            new_arr.append(item)
        return Response(new_arr)


class DirectionAPIView(APIView):
    """
    专业方向选择视图
    """

    def post(self, request):
        info = request.data.get('info')
        direct = []
        # 筛选前端选择的专业所属的方向
        for i in Direction.objects.filter(major__in=info).values('path'):
            direct.append(i["path"])
        return Response(list(set(direct)))


class DirectionCourseAPIView(APIView):
    """
    方向课程展示视图
    """

    def post(self, request):
        # 接收前端传回的学生选择的方向信息
        direction = request.data.get('direction')
        course = []
        type_lis = ['', 'success', 'info', 'danger', 'warning']
        # 依据方向信息从数据库中选择对应方向的对应课程，装进列表里返回给前端显示
        for i in Direction.objects.filter(path__in=direction.split(',')).values('course'):
            course.append({'type': choice(type_lis), 'label': i["course"]})
        return Response(course)

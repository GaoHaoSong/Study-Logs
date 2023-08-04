### 一、安装：
`pip install django`
### 二、创建Django项目
使用Django-admin 来创建项目：
`django-admin startproject Application_Name`
### 三、启动Django项目
进入项目目录，使用`python manage runserver`来启动项目
### 四、创建App
`python manage.py startapp App_name`
然后将App_name添加到setting.py的项目APP列表里面
### 五、创建数据模型
##### 1、在项目下的model里设置数据模型
```
from django.db import models
class wendu(models.Model()):
    shijian = models.DateTimeField()
    text = models.TextField()
    def __str__(self):
        return f"时间：{self.shijian}, 内容：{self.text}"
```
##### 2、在setting中设置数据库为mysql
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'test',
        'USER': 'root',
        'PASSWORD':'12345678',
        'HOST':'192.168.110.138',
        'PORT':'3306',
    }
}
```
##### 3、添加mysql驱动在Django里
在主程序Application_Name下打开__init__.py并添加：
```
import mysql

mysql.install_as_MySqldb()
```
##### 4、迁移数据库
```
python manage.py makemigrations #生成迁移文件

python manage.py migrate #迁移数据库，生成新表
```
### 六、添加App的路由
在主路由下设置
```
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('wendu/',include('App_name.urls'))  #设置包含App_name下的urls.py路由文件
]
```
在App路由下设置
```
from django.urls import path
from . import views

urlpatterns = [
    path('',views.index),
]
```
### 七、设置路由下的views
可以在views中操作操作查询数据库并返回页面
```
from django.shortcuts import render
#数据库对象
def index(request):
    return render(request,"index.html",{'取的名称在html渲染使用':数据库对象}) #第三个参数为可选
```
### 八、设置模板路径
在主程序的setting.py下修改(templates和App文件夹同目录)存放html文件
```
import os
~~~
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR),'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
```
### 九、设置静态资源路径
在主程序的setting.py下修改(static和App文件夹同目录)存放css,js文件
```
STATIC_URL = '/static/'
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static'),
]
```
### 十、修改Django时区
在主程序的setting.py下修改
```
TIME_ZONE = 'Asia/Shanghai'
```

### 安装：
`pip install django`
### 创建Django项目
使用Django-admin 来创建项目：
`django-admin startproject Application_Name`
### 启动Django项目
进入项目目录，使用`python manage runserver`来启动项目
### 创建App
`python manage.py startapp App_name`
然后将App_name添加到setting.py的项目APP列表里面
### 创建数据模型
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

python manage.py magrate #迁移数据库，生成新表
```

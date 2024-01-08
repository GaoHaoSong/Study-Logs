安装uwsgi

```pip install uwsgi```

在/home下新建script文件夹，在内新建uwsgi.ini配置文件

[uwsgi]

# 基本配置
http = 0.0.0.0:8000
socket = /home/script/uwsgi.sock
protocol = uwsgi

# 应用配置
module = Application.wsgi:application
chdir = /home/notice/Application

# 进程配置
workers = 4
threads = 2
master = true
harakiri = 30
max-requests = 5000
vacuum = true

# 性能调优
buffer-size = 32768
limit-as = 512
log-date = true
log-format = %(addr) - %(user) [%(ltime)] "%(method) %(uri) HTTP/1.1" %(status) %(size) "%(referer)" "%(u a)" 
log-4xx = true
log-5xx = true
disable-logging = false
logto = /home/script/uwsgi.log


# 进程pid
pidfile = /home/script/uwsgi.pid



# 启用自动重载选项
py-autoreload = 1

# 禁用uWSGI的缓存
no-orphans = true
disable-logging = true
lazy-apps = true

#!/bin/bash

# 关闭 Nginx
sudo /home/nginx/sbin/nginx -s stop
# 关闭 uWSGI（使用PID文件）
uwsgi --stop /home/script/uwsgi.pid

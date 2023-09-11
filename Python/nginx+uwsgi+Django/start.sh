#!/bin/bash

# 启动 uWSGI
uwsgi --ini /home/script/uwsgi.ini &

# 启动 Nginx
sudo /home/nginx/sbin/nginx &

# 给uwsgi.sock执行权限
 sudo chmod -R 777 /home/script/uwsgi.sock

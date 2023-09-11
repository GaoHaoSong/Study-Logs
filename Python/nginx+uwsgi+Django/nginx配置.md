worker_processes 2;


events {
    worker_connections 4096;
}


http {
    include mime.types;
    default_type application/octet-stream;
    sendfile on;
    keepalive_timeout 15;

    server {
        listen 80;
        server_name localhost;
        # 将所有访问都跳转到https
        # location / {
        #     return 301 https://$host$request_uri;
        # }
        location / {
            root html;
            index index.html index.htm;

        }
        # 将路径前缀为notice的访问使用sock转移到uwsgi
        location /notice {
            # proxy_pass http://127.0.0.1:8000; # 这里的端口应该与你的Django应用程序的端口匹配
            # proxy_set_header Host $host;
            # proxy_set_header X-Real-IP $remote_addr;
            # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            include uwsgi_params;
            uwsgi_pass unix:/home/script/uwsgi.sock;
        }


    }


    # HTTPS server
    server {
        listen 443 ssl;
        server_name wuxiaonline.forshowgames.com;

        ssl_certificate scs1686037062145__.forshowgames.com_server.crt;
        ssl_certificate_key scs1686037062145__.forshowgames.com_server.key;

        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout 5m;

        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;
        location / {
            root html;
            index index.html index.htm;

        }


        error_page 404 /404.html;
        location = /404.html {
            root html;
        }
        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
            root html;
        }

        location /nginx_status {
            stub_status on;
            auth_basic "Restricted Access"; # 设置身份验证提示信息
            auth_basic_user_file /home/nginx/htpasswd;
        }
    }
}

1、在编译之前，确保你的系统上已经安装了编译工具和 Nginx 所需的依赖项。在 Debian/Ubuntu 系统上，你可以使用以下命令安装：

```
sudo apt-get update
sudo apt-get install build-essential
```

2、进入解压缩后的 Nginx 目录：
使用 cd 命令进入解压缩后的 Nginx 目录。
```
cd nginx-版本号
```
3、配置编译选项：
运行 ./configure 来配置编译选项。你可以根据需要添加或删除选项，比如指定安装路径、启用或禁用模块等。以下是一个简单的例子：
```
./configure --prefix=/usr/local/nginx
```
这将把 Nginx 安装到 /usr/local/nginx 目录下。
以下是添加了SSL模块
```
./configure --prefix=/usr/local/nginx --with-http_ssl_module
```

4、执行编译和安装命令：
运行 make 来编译源代码，然后使用 make install 安装到指定的目录：
```
make
sudo make install
```
sudo 是为了确保你有足够的权限来安装到系统目录。

5、启动 Nginx：
安装完成后，你可以使用以下命令启动 Nginx：
```
/usr/local/nginx/sbin/nginx
```
如果你使用了不同的安装路径，请相应地修改路径。

6、验证安装：
打开浏览器，访问服务器的 IP 地址或域名，应该能够看到 Nginx 的欢迎页面。

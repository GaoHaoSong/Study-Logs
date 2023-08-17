1、首先安装php环境，添加环境变量。cmd运行php -v显示版本信息。安装完成

2、解压Apache httpd压缩包，定位到./Apache24/conf/httpd.conf编辑

3、在LoadModule下添加php信息
```
LoadModule php7_module "D:/Program Files/php/php7apache2_4.dll"       #apache插件信息位置（nts版本不带，选ts版）
PHPIniDir "D:/Program Files/php"                                      #php位置
AddType application/x-httpd-php .php .phtml                           #固定写法
```

4、将php项目放置./Apache24/htdocs下

5、运行./Apache24/bin/httpd 打开127.0.0.1查看项目

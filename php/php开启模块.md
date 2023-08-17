1、打开php根目录看到php.ini-development将其复制一个改成 php.ini

2、修改php.ini,将`;cgi.fix_pathinfo=1`改成`cgi.fix_pathinfo=1`,去掉前面的冒号

3、将`extension= ***`前面的冒号去掉，开启扩展成功。

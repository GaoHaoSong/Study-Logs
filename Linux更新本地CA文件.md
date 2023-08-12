服务器在使用curl和wget时,提示服务端ssl证书不可用，是由于linux使用的旧版本导致，旧版本的CA证书不支持新的SSL证书或机构。

```https://curl.se/ca/cacert.pem```

下载这个pem文件 然后改后缀为crt，复制到/usr/local/share/ca-certificates/

然后运行`sudo update-ca-certificates`安装证书就行啦



1、去mysql官网手动下载rpm包并上传到服务器，或者直接通过wget进行下载

```wget https://downloads.mysql.com/archives/get/p/23/file/mysql-8.0.31-1.el7.x86_64.rpm-bundle.tar```

2、创建对应的目录并解压

```mkdir mysql8```

```tar xvf mysql-8.0.31-1.el7.x86_64.rpm-bundle.tar -C ./mysql8```

3、安装

```cd ./mysql8```

```yum install -y *.rpm```

出现complete则安装成功

4、启动mysql，并查看初始密码

```systemctl start mysqld```

```cat /var/log/mysqld.log | grep password```

5、修改密码

首先登录mysql并修改root密码

```mysql -uroot -p```

回车，然后输入上面查询的初始密码

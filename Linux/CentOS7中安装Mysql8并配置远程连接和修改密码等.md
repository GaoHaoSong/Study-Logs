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

输入修改root密码的语句，此时默认的密码安全校验等级较高，不能设置简单的密码。(把Aa_123456替换成你的密码)

```ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Aa_123456' password expire never;```

6、继续执行sql语句，设置允许远程连接

```use mysql```

```update user set user.Host='%'where user.User='root';```

```flush privileges;```

```quit;```

7、开放服务器防火墙3306端口

```firewall-cmd --zone=public --add-port=3306/tcp --permanent```

```firewall-cmd --reload```






8、忘记mysql密码的操作：

8.1.修改文件vim /etc/my.cnf

在最后一行加入`skip-grant-tables`  后可以免密登录

8.2.重启mysql :

`systemctl restart mysql `

8.3.登录 mysql -u root

更改密码策略 `set global validate_password.policy=LOW;`

修改root密码为空

`update user set authentication_string='' where user='root';`

注销最后一行免密设置；

8.4.重启mysql :

`systemctl restart mysql ；`

重新登录 `mysql -u root `

修改root密码

`ALTER USER  'root'@'%'  IDENTIFIED BY  '新的密码';`












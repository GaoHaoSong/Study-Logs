由于centos7.9自带Python2，但是目前Python2已经被遗弃。所以我们需要安装使用Python3.

使用以下命令安装Python3

```sudo yum install python3```

使用以下命令卸载Python3

```sudo yum remove python3```

## 但是此刻安装的python版本为3.6，我们需要安装更高版本的python，例如python3.11

1、下载最新的软件安装包

```wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz```

2、解压缩安装包

```tar -zxvf Python-3.11.0.tgz```

3、安装源码编译需要的编译环境

```sudo yum -y install epel-release wget make cmake gcc bzip2-devel libffi-devel zlib-devel perl```

4、在CentOS 7上安装 OpenSSL 1.1.x

卸载老版本

```sudo yum remove openssl```

```wget https://www.openssl.org/source/openssl-1.1.1u.tar.gz```

```tar zxvf ./openssl-1.1.1u.tar.gz```

```./config```

```make && sudo make install```

```sudo echo /usr/local/lib64/ >> /etc/ld.so.conf.d/common.conf```  #配置so文件的位置

```sudo echo /usr/local/lib/ >> /etc/ld.so.conf.d/common.conf```  #配置so文件的位置

```sudo ldconfig```  reboot后#启用so文件位置的配置

验证

```openssl version```

5、安装readline-devel，可以解决后期出现的方向键、删除键乱码问题，这里提前避免。

```yum install readline-devel```

6、配置构建

```export CFLAGS=$(pkg-config --cflags openssl11)```

```export LDFLAGS=$(pkg-config --libs openssl11)```

7、进入刚解压缩的目录

```cd ./Python-3.11.0```

8、指定python3的安装目录为 /usr/python 并使用ssl模块，指定目录好处是后期删除此文件夹就可以完全删除软件了。

```./configure --prefix=/usr/local/python3.11 --with-openssl-rpath=auto```

9、编译并安装

```make```

```make install```


10、更新软链接

```sudo ln -s /usr/local/python3.11/bin/python3 /usr/bin/python3```

```sudo ln -s /usr/local/python3.11/bin/pip3 /usr/bin/pip3```


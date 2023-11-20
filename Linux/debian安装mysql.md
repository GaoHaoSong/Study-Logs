1、更新软件源信息
在安装 MySQL 之前，需要更新本地软件仓库的信息。使用下面的命令来更新软件仓库：
```
sudo apt-get update
```
2、安装 MySQL
使用下面的命令来安装 MySQL：
```
sudo apt-get install mysql-server
```
3、配置 MySQL
一旦 MySQL 安装完成，就可以开始配置 MySQL 了。

首先，使用下面的命令启动 MySQL 服务：
```
sudo systemctl start mysql
```
然后，运行下面的命令来启用 MySQL 服务，并将其设置为在系统启动时自动启动：
```
sudo systemctl enable mysql
```
现在，您可以使用以下命令检查 MySQL 服务是否正在运行：
```
sudo systemctl status mysql
```
如果一切正常，您应该看到 MySQL 服务处于运行状态。

4、设置 MySQL 根用户密码
默认情况下，MySQL root 用户没有密码。为了保护您的 MySQL 数据库的安全，您需要设置 MySQL 根用户密码。

使用下面的命令来设置 MySQL 根用户的密码：
```
sudo mysql_secure_installation
```
在这个脚本中，您需要回答一些问题，例如是否要删除匿名用户，是否禁止远程 root 用户登录等。按照提示输入相应的信息即可。最后，您将要被要求设置 MySQL 根用户的密码。请不要使用空的密码，应该选择一个强密码以确保您的数据库的安全。

5、开启远程
打开 MySQL 或 MariaDB 的配置文件。在 Debian 中，MySQL 的配置文件通常在 /etc/mysql/mysql.conf.d/mysqld.cnf，而 MariaDB 的配置文件通常在 /etc/mysql/mariadb.conf.d/50-server.cnf。
在配置文件中，查找 bind-address 项，并确保它的值为 0.0.0.0，以允许来自所有 IP 地址的连接。


先登录上数据库：
```
mysql -hlocalhost -uroot -p -P3306
```
然后切换到mysql db
```
use mysql;
```
查表获取当前的配置信息：
```
select host, user from user;
```
![image](https://github.com/GaoHaoSong/Study-Logs/assets/25843420/0d2890d3-7e72-4d99-a0e6-d4869149f94f)
可以看到这里并没有允许远程连接，需要授权root用户的所有权限并设置远程访问。

依次执行：
```
//任何远程主机都可以使用root账号访问数据库
CREATE USER 'root'@'%' IDENTIFIED BY 'root密码';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root密码';
```
```
//刷新以便立即生效
FLUSH PRIVILEGES;
```

reset                     清除控制端输入

lsblk                     查看硬盘分区

df -h                    查看硬盘使用量

free -h                   以可读方式查看内存使用量

ps -ef|grep 进程名称       查找进程          

which 关键字              查找程序位置（which" 命令仅用于查找可执行程序的路径，而不会提供关于程序的详细信息。如果你想获取有关命令的更多信息，比如其版本号、帮助文档等，你可能需要使用其他命令，如 "man"（用于查看命令的手册页）或命令本身的 "--help" 选项。）

使用tar压缩和解压缩：

压缩文件：`tar -czvf compressed_file.tar.gz file1 file2 file3`

压缩文件夹：`tar -czvf compressed_folder.tar.gz folder_name`

解压缩：`tar -xzvf compressed_file.tar.gz`

常见选项解释：

-c: 创建一个新的压缩文件

-z: 使用gzip压缩

-v: 显示详细信息

-f: 指定压缩文件的名称

-r: 递归处理文件夹

-x: 解压缩











rm -rf 文件夹        删除文件下及以下文件   -r递归  -f强制


chmod -R 777 /path/to/directory   获取文件夹以及递归文件所有权


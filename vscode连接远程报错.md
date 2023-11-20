当远程服务器重置后，连接过远程的vscode再次连接时会报错“连接管道不存在”，这个原因是本地的known_hosts文件记录服务器信息与现服务器的信息冲突了，导致连接失败。
解决方案就是把本地的known_hosts的原服务器信息全部删掉，然后重新连接。
![image](https://github.com/GaoHaoSong/Study-Logs/assets/25843420/8bde1763-45db-4455-a2d5-ee215676592a)

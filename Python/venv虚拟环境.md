### 安装并进入激活venv虚拟环境
使用python -m venv venv01  创建venv01下的虚拟环境

在 Windows 上：
`venv\Scripts\activate`

在 macOS/Linux 上：
`source venv/bin/activate`


进入环境后，命令行前会出现（venv01）虚拟环境名称，此时激活虚拟环境成功

### 在VScode中使用venv虚拟环境
右下角选择Python版本，选择虚拟环境即刻。

![image](https://github.com/GaoHaoSong/Study-Logs/assets/25843420/d92c8b8b-7436-4f2d-9920-e7c05397b066)

若powershell报错，更新：

查看当前版本：`$host`

使用winget查找最新版本： `winget search Microsoft.PowerShell`

安装最新版本：`winget install --id Microsoft.Powershell --source winget`

### 导出包以及安装
导出：`pip freeze > requirements.txt`

安装：`pip install -r requirements.txt`


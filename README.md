# docker-zentao

## https://github.com/chaiyd/zentao.git
禅道Docker Image File

可挂载目录
/app/zentaopms:该目录为禅道目录，里面包含禅道代码及附件上传目录。

首次运行容器后，浏览器访问http://IP:端口，如果界面显示禅道安装界面，说明容器运行正常。
依照安装程序，最后将禅道安装成功，就可以使用禅道了。

此版本和官方不同在于，需要自己手动安装数据库，此镜像已删除数据库

使用debian:10-slim 构建

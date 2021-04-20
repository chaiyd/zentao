# docker-zentao

* https://github.com/chaiyd/zentao.git
* https://hub.docker.com/repository/docker/chaiyd/zentao

## 禅道
* 禅道是专业的研发项目管理软件


## 准备工作
* install docker
* install docker-composer

* 修改.env文件内部参数/密码等信息

## 访问

`docker-compose up -d`

* 首次运行
  * 浏览器访问http://ip:9080
  * 如果网页界面显示禅道安装界面，说明容器运行正常。
  * 依照禅道安装程序，最后将禅道安装成功，就可以使用禅道了。

此版本和官方不同在于，需要自己手动安装数据库，此镜像已删除数据库

使用debian:10-slim 构建

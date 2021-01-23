# docker-zentao

* https://github.com/chaiyd/zentao.git

## 禅道
* 禅道是专业的研发项目管理软件


## docker-compose
```
version: '3'

services:
    zentao:
        image: chaiyd/zentao:12.5.3
        ports:
            - 9080:80
        volumes:
          - zentao-data:/app/zentaopms #该目录为禅道目录，里面包含禅道代码及附件上传目录。
        depends_on:
            - mysql
        restart: always

    mysql:
        image: mysql:5.7
        environment:
            MYSQL_ROOT_PASSWORD: ukC2ZkcG_ZTeb
            MYSQL_DATABASE: zentao
            MYSQL_USER: zentao
            MYSQL_PASSWORD: ukC2ZkcG_ZTeb
        ports:
          - 3306:3306            
        volumes:
          - mysql-data:/var/lib/mysql
volumes:
  mysql-data:
  zentao-data:
```

## 访问
* 使用如上docker-compose
* 首次运行
  * 浏览器访问http://ip:9080
  * 如果界面显示禅道安装界面，说明容器运行正常。
  * 依照安装程序，最后将禅道安装成功，就可以使用禅道了。

此版本和官方不同在于，需要自己手动安装数据库，此镜像已删除数据库

使用debian:10-slim 构建

# 一、纸蜂平台的微服务架构 - docker和docker-compose

# 前言

这是一次完整的项目实践，Angular页面+Springboot接口+MySQL都通过Dockerfile打包成docker镜像，通过docker-compose做统一编排。目的是实现整个项目产品的轻量级和灵活性，在将各个模块的镜像都上传公共镜像仓库后，任何人都可以通过 “docker-compose up -d” 一行命令，将整个项目的前端、后端、数据库以及文件服务器等，运行在自己的服务器上。
本项目是开发一个类似于segmentfault的文章共享社区，我的设想是当部署在个人服务器上时就是个人的文章库，部署在项目组的服务器上就是项目内部的文章库，部署在公司的服务器上就是所有职工的文章共享社区。突出的特点就是，项目相关的所有应用和文件资源都是灵活的，用户可以傻瓜式地部署并使用，对宿主机没有任何依赖。
目前一共有三个docker镜像，考虑以后打在一个镜像中，但目前只能通过docker-compose来编排这三个镜像。

1. **MySQL**镜像：以MySQL为基础，将项目所用到的数据库、表结构以及一些基础表的数据库，通过SQL脚本打包在镜像中。用户在启动镜像后就自动创建了项目所有的数据库、表和基础表数据。
2. **SpringBoot**镜像：后台接口通过SpringBoot开发，开发完成后直接可以打成镜像，由于其内置tomcat，可以直接运行，数据库指向启动好的MySQL容器中的数据库。
3. **Nginx**（Angular）镜像：Nginx镜像中打包了Angular项目的dist目录资源，以及default.conf文件。主要的作用有：部署Angular项目页面；挂载宿主机目录作为文件服务器；以及反向代理SpringBoot接口，解决跨域问题等等。

最后三个docker容器的编排通过docker-compose来实现，三个容器之间的相互访问都通过容器内部的别名，避免了宿主机迁移时ip无法对应的问题。为了方便开发，顺便配了个自动部署。

# MySQL镜像

## 初始化脚本

在项目完成后，需要生成项目所需数据库、表结构以及基础表数据的脚本，保证在运行该docker容器中，启动MySQL数据库时，自动构建数据库和表结构，并初始化基础表数据。
Navicat for MySQL的客户端支持导出数据库的表结构和表数据的SQL脚本。
如果没有安装Navicat，可以在连接上容器中开发用的MySQL数据库，通过mysqldump 命令导出数据库表结构和数据的SQL脚本。下文中就是将数据库的SQL脚本导出到宿主机的/bees/sql 目录：

``` 
docker exec -it  mysql mysqldump -uroot -pPASSWORD 数据库名称 > /bees/sql/数据库名称.sql
```

以上只是导出 表结构和表数据的脚本，还要在SQL脚本最上方加上 生成数据库的SQL：

``` sql
drop database if exists 数据库名称;
create database 数据库名称;
use 数据库名称;
```

通过以上两个步骤，数据库、表结构和表数据三者的初始化SQL脚本就生成好了。

## Dockerfile构建镜像

我们生成的SQL脚本叫 bees.sql,在MySQL官方镜像中提供了容器启动时自动执行/docker-entrypoint-initdb.d文件夹下的脚本的功能(包括shell脚本和sql脚本)，我们在后续生成镜像的时候，将上述生成的SQL脚本COPY到MySQL的/docker-entrypoint-initdb.d目录下就可以了。
现在我们写Dockerfile，很简单：

``` docker
FROM mysql

MAINTAINER kerry(kerry.wu@definesys.com)

COPY bees.sql /docker-entrypoint-initdb.d
```

将 bees.sql 和 Dockerfile 两个文件放在同一目录，执行构建镜像的命令就可以了：

```
docker build -t bees-mysql .
```

现在通过 docker images，就能看到本地的镜像库中就已经新建了一个 bees-mysql的镜像啦。

# SpringBoot镜像

springboot构建镜像的方式很多，有通过代码生成镜像的，也有通过jar包生成镜像的。我不想对代码有任何污染，就选择后者，通过生成的jar包构建镜像。
创建一个目录，上传已经准备好的springboot的jar包，这里名为bees-0.0.1-SNAPSHOT.jar，然后同样编写Dockerfile文件：

``` docker
FROM java:8
VOLUME /tmp
ADD bees-0.0.1-SNAPSHOT.jar /bees-springboot.jar
EXPOSE 8010
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","-Denv=DEV","/bees-springboot.jar"]
```

将bees-0.0.1-SNAPSHOT.jar和Dockerfile放在同一目录执行命令开始构建镜像，同样在本地镜像库中就生成了bees-springboot的镜像：

```
docker build -t bees-springboot .
```

# Nginx（Angular）镜像

## Nginx的配置

该镜像主要在于nginx上conf.d/default.conf文件的配置，主要实现三个需求：

1.Angualr部署

Angular的部署很简单，只要将Angular项目通过 ng build --prod 命令生成dist目录，将dist目录作为静态资源文件放在服务器上访问就行。我们这里就把dist目录打包在nginx容器中，在default.conf上配置访问。

2、文件服务器

项目为文章共享社区，少不了的就是一个存储文章的文件服务器，包括存储一些图片之类的静态资源。需要在容器中创建一个文件目录，通过default.conf上的配置将该目录代理出来，可以直接访问目录中的文件。
当然为了不丢失，这些文件最好是保存在宿主机上，在启动容器时可以将宿主机本地的目录挂载到容器中的文件目录。

3、接口跨域问题

在前后端分离开发的项目中，“跨域问题”是较为常见的，SpringBoot的容器和Angular所在的容器不在同一个ip和端口，我们同样可以在default.conf上配置反向代理，将后台接口代理成同一个ip和端口的地址。

话不多说，结合上面三个问题，我们最终的default.conf为：

``` nginx
server {
    listen       80;

    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        try_files $uri $uri/ /index.html;
    }
    
    location /api/ {
        proxy_pass http://beesSpringboot:8010/;
    }

    location /file {
        alias /home/file;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```

1. location / :代理的是Angular项目，dist目录内通过Dockerfile
   COPY在容器内的/usr/share/nginx/html目录；
2. location /file ：代理/home/file 目录，作为文件服务器；
3. location /api/ :是为了解决跨域而做的反向代理，为了脱离宿主机的限制，接口所在容器的ip通过别名beesSpringboot来代替。别名的设置是在docker-compose.yml中设置的，后续再讲。

## Dockerfile构建镜像

同样创建一个目录，包含Angualr的dist目录、Dockerfile和nginx的default.conf文件，目录结构如下：

``` vim
[root@Kerry angular]# tree
.
├── dist
│   └── Bees
│       ├── 0.cb202cb30edaa3c93602.js
│       ├── 1.3ac3c111a5945a7fdac6.js
│       ├── 2.99bfc194c4daea8390b3.js
│       ├── 3.50547336e0234937eb51.js
│       ├── 3rdpartylicenses.txt
│       ├── 4.53141e3db614f9aa6fe0.js
│       ├── assets
│       │   └── images
│       │       ├── login_background.jpg
│       │       └── logo.png
│       ├── favicon.ico
│       ├── index.html
│       ├── login_background.7eaf4f9ce82855adb045.jpg
│       ├── main.894e80999bf907c5627b.js
│       ├── polyfills.6960d5ea49e64403a1af.js
│       ├── runtime.37fed2633286b6e47576.js
│       └── styles.9e4729a9c6b60618a6c6.css
├── Dockerfile
└── nginx
    └── default.conf
```

Dockerfile文件如下：

``` docker
FROM nginx

COPY nginx/default.conf /etc/nginx/conf.d/

RUN rm -rf /usr/share/nginx/html/*

COPY /dist/Bees /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
```

以上，通过下列命令，构建bees-nginx-angular的镜像完成：

```
docker build -t bees-nginx-angular .
```

# docker-compose容器服务编排

上述，我们已经构建了三个镜像，相对应的至少要启动三个容器来完成项目的运行。那要执行三个docker run？太麻烦了，而且这三个容器之间还需要相互通信，如果只使用docker来做的话，不光启动容器的命令会很长，而且为了容器之间的通信，docker --link 都会十分复杂，这里我们需要一个服务编排。docker的编排名气最大的当然是kubernetes，但我的初衷是让这个项目轻量级，不太希望用户安装偏重量级的kubernetes才能运行，而我暂时又没能解决将三个镜像构建成一个镜像的技术问题，就选择了适中的一个产品--docker-compse。
安装docker-compose很简单，这里就不赘言了。安装完之后，随便找个目录，写一个docker-compose.yml文件，然后在该文件所在地方执行一行命令就能将三个容器启动了：

```
#启动
docker-compose up -d
#关闭
docker-compose down
```

这里直接上我写的docker-compose.yml文件

``` yaml
version: "2"
services:

 beesMysql:
  restart: always
  image: bees-mysql
  ports:
   - 3306:3306
  volumes:
   - /bees/docker_volume/mysql/conf:/etc/mysql/conf.d
   - /bees/docker_volume/mysql/logs:/logs
   - /bees/docker_volume/mysql/data:/var/lib/mysql
  environment:
   MYSQL_ROOT_PASSWORD: kerry

 beesSpringboot:
  restart: always
  image: bees-springboot
  ports:
   - 8010:8010
  depends_on:
   - beesMysql

 beesNginxAngular:
  restart: always
  image: bees-nginx-angular
  ports:
   - 8000:80
  depends_on:
   - beesSpringboot
  volumes:
   - /bees/docker_volume/nginx/nginx.conf:/etc/nginx/nginx.conf
   - /bees/docker_volume/nginx/conf.d:/etc/nginx/conf.d
   - /bees/docker_volume/nginx/file:/home/file
```

image:镜像名称

ports:容器的端口和宿主机的端口的映射

services:文中三个service，在各自容器启动后就会自动生成别名，例如：在springboot中访问数据库，只需要通过“beesMysql:3306”就能访问。

depends_on:会设置被依赖的容器启动之后，才会启动自己。例如：mysql数据库容器启动后，再启动springboot接口的容器。

volumes：挂载卷，一些需要长久保存的文件，可通过宿主机中的目录，挂载到容器中，否则容器重启后会丢失。例如：数据库的数据文件；nginx的配置文件和文件服务器目录。

# 其他

## 自动部署

为了提高开发效率，简单写了一个自动部署的脚本，直接贴脚本了：

``` makefile
#!/bin/bash

v_springboot_jar=`find /bees/devops/upload/ -name "*.jar"`
echo "找到jar:"$v_springboot_jar
v_angular_zip=`find /bees/devops/upload/ -name "dist.zip"`
echo "找到dist:"$v_angular_zip

cd /bees/conf/
docker-compose down
echo "关闭容器"

docker rmi -f $(docker images |  grep "bees-springboot"  | awk '{print $1}')
docker rmi -f $(docker images |  grep "bees-nginx-angular"  | awk '{print $1}')
echo "删除镜像"

cd /bees/devops/dockerfiles/springboot/
rm -f *.jar
cp $v_springboot_jar ./bees-0.0.1-SNAPSHOT.jar
docker build -t bees-springboot .
echo "生成springboot镜像"

cd /bees/devops/dockerfiles/angular/
rm -rf dist/
cp $v_angular_zip ./dist.zip
unzip dist.zip
rm -f dist.zip
docker build -t bees-nginx-angular .
echo "生成angular镜像"

cd /bees/conf/
docker-compose up -d
echo "启动容器"
docker ps
```

## 遇到的坑

一开始在docker-compose.yml文件中写services时，每个service不是驼峰式命名，而是下划线连接，例如:bees_springboot、bees_mysql、bees_nginx_angular 。

在springboot中访问数据库的别名可以，但是在nginx中，反向代理springboot接口地址时死活代理不了 bees_springboot的别名。能在bees_nginx_angular的容器中ping通bees_springboot，但是代理不了bees_springboot地址的接口，通过curl -v 查看原因，是丢失了host。

最后发现，nginx默认request的header中包含“_”下划线时，会自动忽略掉。我因此把docker-compose.yml中service名称，从下划线命名都改成了驼峰式。

当然也可以通过在nginx里的nginx.conf配置文件中的http部分中添加如下配置解决：

```
underscores_in_headers on;
```



# 二、纸蜂平台的微服务架构 - k8s迁移

# 前言
我们一起回顾上一篇文章《Bees平台的微服务架构（1）docker和docker-compose》，一共通过Dockerfile构建了三个docker镜像：**mysql**数据库，部署angular前端页面的**nginx**，和**springboot**接口。然后使用**docker-compose**来做容器服务的编排，以保障不同容器之间可以互访。为了提高开发的效率，我们还写了一个自动部署的脚本，实际是只是通过docker-compose.yml启动和关闭容器，在本地镜像库中生成或删除镜像。

不可否认，docker-compose服务编排的小巧灵活性让人爱不释手，那我们今天为什么要迁移到k8s（**kubernetes**）上呢?因为k8s的编排能力更强，因为k8s可以做跨主机的分布式集群，因为k8s搭载rancher将更有利于微服务架构的统一管理，等等。

# k8s准备
本文将不讲解k8s和rancher的安装和配置，相关的安装文档和配置文档网上有很多。最近阿里云产品春节大促销，我一时没忍住又买了一台服务器，打完折扣还是很贵。心疼归心疼，不过这样我就有两台服务器了，就顺便搭建了k8s的集群环境。
## 镜像仓库
分布式集群带来的复杂度就增加了。你没办法直接使用本地的镜像库地址了，我不想搭建镜像仓库，好在阿里的docker镜像仓库是免费的，就将最终版的docker镜像推送到阿里的容器仓库里面。当需要启动容器时，容器的地址就写阿里容器仓库里的地址，后文中会出现。
## 宿主机挂载卷
分布式的另一个问题就是宿主机的挂载卷，如果对上一篇文章印象深刻的话，应该记得mysql数据库的数据文件和nginx代理的图片文件等，都是挂载在宿主机上的。因为docker容器的特性，如果不使用挂载卷，在重启容器之后容器内的数据都会丢失。分布式环境中，不同主机之间是没办法互访目录的。我是通过在一台机器上搭建了nfs服务器，将单台机器上的目录开放为共享目录，具体内容下文有介绍。
## 服务互访
不同服务之间免不了要相互访问，例如：springboot要访问数据库和redis，angualr要调用springboot接口。而且考虑到k8s上经常要对某个服务做多节点的集群，所以要在注册中心开放给外界访问的地址应该是集群的地址。

我们在docker-compose上是怎么做的呢？在docker-compose.yml 上定义多个服务service，每个service对应于一个镜像。容器启动后，对应容器的服务名称即可以作为 hostname来使用。

k8s上也有类似的用法，它使用yaml文件，kind类型有很多，例如：Pod表示启动的服务是一个pod；ReplicationController则会根据Pod模板生成一批pod作为集群；Service则相当于服务的注册，可给与之对应的pod副本集群提供访问地址，等等还有很多。那这个问题Service就能解决，我们给不同的服务都创建一个Service，这样就也能同docker-compose一样通过服务的名称就能访问与之对应服务的pod副本集群。
## 其他
因为业务需要，在之前的三个镜像的基础上又加了一个redis镜像。那么分布式redis、分布式mysql环境搭建就太麻烦了，如果以后有机会再单独写文章来介绍，这次我干脆就只启动单节点的mysql和redis。

# nfs共享目录
NFS是Network File System的简写，即网络文件系统，NFS是FreeBSD支持的文件系统中的一种。NFS基于RPC(Remote Procedure Call)远程过程调用实现，其允许一个系统在网络上与它人共享目录和文件。通过使用NFS，用户和程序就可以像访问本地文件一样访问远端系统上的文件。NFS是一个非常稳定的，可移植的网络文件系统。

选用nfs的另一个原因是，nfs服务在k8s上可以直接作为存储卷使用，十分方便。
## 安装
nfs是基于rpc的，安装nfs就需要确保已安装rpcbind，不过一般CentOS都默认已安装了rpcbind
``` vim
##查找是否已安装nfs 和 rpcbind
[mpaas@kerry1 k8s]$ rpm -qa | grep nfs
[mpaas@kerry1 k8s]$ rpm -qa | grep rpcbind
##如果没安装，则通过有yum安装
[mpaas@kerry1 k8s]$ yum -y install nfs-utils
[mpaas@kerry1 k8s]$ yum -y install rpcbind
```
安装完成后，必须要先启动rpcbind服务，再启动nfs服务
``` 
[mpaas@kerry1 k8s]$ systemctl start rpcbind
[mpaas@kerry1 k8s]$ systemctl start nfs-server
```
设置开机启动
```
[mpaas@kerry1 k8s]$ systemctl enable rpcbind
[mpaas@kerry1 k8s]$ systemctl enable nfs-server
```
## 配置
通过修改  /etc/exports 文件，设置nfs的共享目录
```
/home/nfs/bees/mysql/data *(rw,no_root_squash,no_all_squash,sync)
```
如上，将 /home/nfs/bees/mysql/data作为共享目录

星号* 代表可在任意服务器上访问该共享目录，也可以指定特点的ip和端口访问

括号内是参数设置，常见的参数则有：
``` vim
rw　　ro    该目录分享的权限是可擦写 (read-write) 或只读 (read-only)，但最终能不能读写，还是与文件系统的 rwx 及身份有关。

sync　　async    sync 代表数据会同步写入到内存与硬盘中，async 则代表数据会先暂存于内存当中，而非直接写入硬盘！

no_root_squash　　root_squash    客户端使用 NFS 文件系统的账号若为 root 时，系统该如何判断这个账号的身份？预设的情况下，客户端 root 的身份会由 root_squash 的设定压缩成 nfsnobody， 如此对服务器的系统会较有保障。但如果你想要开放客户端使用 root 身份来操作服务器的文件系统，那么这里就得要开 no_root_squash 才行！

all_squash    不论登入 NFS 的使用者身份为何， 他的身份都会被压缩成为匿名用户，通常也就是 nobody(nfsnobody) 啦！

anonuid　　anongid    anon 意指 anonymous (匿名者) 前面关于 *_squash 提到的匿名用户的 UID 设定值，通常为 nobody(nfsnobody)，但是你可以自行设定这个 UID 的值！当然，这个 UID 必需要存在于你的 /etc/passwd 当中！ anonuid 指的是 UID 而 anongid 则是群组的 GID 啰。
```

编辑完 /etc/exports 文件后，执行下列命令生效
```
[mpaas@kerry1 k8s]$  exportfs -r
```

在服务器端，可执行下列命令查看目录是否共享成功
```
[mpaas@kerry1 k8s]$ showmount -e localhost
Export list for localhost:
/home/nfs/bees/mysql/data *
```
也可以在另外一台机器上安装nfs后执行上述命令，只需要将localhost换成目标服务器的ip地址即可。
# nginx服务
先启动nginx来部署angualr，我们需要创建一个RC，根据模板创建pods，暂时只创建一个pod，后续如果需要扩展再在rancher上管理。

创建bees_angular_rc.yaml，开放pod的80端口
```  yaml
apiVersion: v1
kind: ReplicationController
metadata:
 name: bees-angular
spec:
 replicas: 1
 selector:
  app: bees-angular
 template:
  metadata:
   labels:
    app: bees-angular
  spec:
   containers:
   - name: bees-angular
     image: registry.cn-hangzhou.aliyuncs.com/kerry2019/bees-nginx:v1.0
     ports:
     - containerPort: 80
```
创建bees_angualr_svc.yaml，设置nodePort，将pod的80端口映射给宿主机的30000端口
``` yaml
apiVersion: v1
kind: Service
metadata:
 name: bees-angular
spec:
 type: NodePort
 ports: 
  - port: 80
    nodePort: 30000
 selector:
  app: bees-angular
```
那么执行下列命令即可创建rc和service，与之对应的pod也会运行起来
``` 
##启动rc
[mpaas@kerry1 k8s]$ kubectl create -f bees-angular-rc.yaml 
##启动service
[mpaas@kerry1 k8s]$ kubectl create -f bees-angular-svc.yaml 
##查看pod是否启动成功
[mpaas@kerry1 k8s]$ kubectl get pods
```
# mysql服务
创建bees_mysql_rc.yaml，开放pod的3306端口，并将nfs服务器上的共享目录 /home/nfs/bees/mysql/data 挂载到容器中
``` yaml
apiVersion: v1
kind: ReplicationController
metadata:
 name: bees-mysql
spec:
 replicas: 1
 selector:
  app: bees-mysql
 template:
  metadata:
   labels:
    app: bees-mysql
  spec:
   containers:
   - name: bees-mysql
     image: registry.cn-hangzhou.aliyuncs.com/kerry2019/bees-mysql:v1.0
     ports:
     - containerPort: 3306
     env:
     - name: MYSQL_ROOT_PASSWORD
       value: 数据库密码
     volumeMounts:
     - name: mysql-data-persistent-storage
       mountPath: /var/lib/mysql
   volumes:
   - name: mysql-data-persistent-storage
     nfs:
      path: /home/nfs/bees/mysql/data
      server: nfs服务器的ip
```
创建bees_mysql_svc.yaml

``` yaml
apiVersion: v1
kind: Service
metadata:
 name: bees-mysql
spec:
 type: NodePort
 ports: 
  - port: 3306
    nodePort: 30003
 selector:
  app: bees-mysql
```
# springboot服务
bees_springboot_rc.yaml
``` yaml
kind: ReplicationController
metadata:
 name: bees-springboot
spec:
 replicas: 1
 selector:
  app: bees-springboot
 template:
  metadata:
   labels:
    app: bees-springboot
  spec:
   containers:
   - name: bees-springboot
     image: registry.cn-hangzhou.aliyuncs.com/kerry2019/bees-springboot:v1.0
     ports:
     - containerPort: 8010
```
bees_springboot_svc.yaml
``` yaml
apiVersion: v1
kind: Service
metadata:
 name: bees-springboot
spec:
 type: NodePort
 ports: 
  - port: 8010
    nodePort: 30004
 selector:
  app: bees-springboot
```
都是一些基础的代码使用，这里就不过多写了。

# 打包镜像推送仓库的脚本
``` vim
#!/bin/bash

echo "nginx版本："$1
echo "springboot版本："$2

v_springboot_jar=`find /bees/devops/upload/ -name "*.jar"`
echo "找到jar:"$v_springboot_jar
v_angular_zip=`find /bees/devops/upload/ -name "dist.zip"`
echo "找到dist:"$v_angular_zip

docker rmi -f $(docker images|grep "paperbee-nginx" | awk '{print $3}')
docker rmi -f $(docker images|grep "paperbee-springboot" | awk '{print $3}')
echo "删除原镜像"

cd /bees/devops/dockerfiles/springboot-k8s/
rm -f *.jar
cp $v_springboot_jar ./bees-0.0.1-SNAPSHOT.jar
docker build -t paperbee-springboot .
echo "生成springboot镜像"

cd /bees/devops/dockerfiles/angular-k8s/
rm -rf dist/
cp $v_angular_zip ./dist.zip
unzip dist.zip
rm -f dist.zip
docker build -t paperbee-nginx .
echo "生成angular镜像"

docker login --username=账号--password=密码 registry.cn-hangzhou.aliyuncs.com
echo "登录docker容器仓库"

v_nginx_image=$(docker images|grep "paperbee-nginx" | awk '{print $3}')
v_springboot_image=$(docker images|grep "paperbee-springboot" | awk '{print $3}')


docker tag $v_nginx_image registry.cn-hangzhou.aliyuncs.com/kerry2019/bees-nginx:$1
docker push registry.cn-hangzhou.aliyuncs.com/kerry2019/bees-nginx:$1
echo "推送 bees-nginx:"$1


docker tag $v_springboot_image registry.cn-hangzhou.aliyuncs.com/kerry2019/bees-springboot:$2
docker push registry.cn-hangzhou.aliyuncs.com/kerry2019/bees-springboot:$2
echo "推送 bees-springboot:"$2

```
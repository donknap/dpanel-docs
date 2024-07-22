# 使用 Docker 安装

> 国内镜像 ccr.ccs.tencentyun.com/dpanel/dpanel:latest

##### 新建 DPanel 默认网络

DPanel 转发域名到容器时，需要将目标容器放置到默认网络中，以 Hostname 的形式进行转发。

如果需要使用域名转发功能，请创建此网络。
如果提示网络已经存在，请先删除 docker network rm dpanel-local

```
docker network create dpanel-local
```

##### 创建容器

> macos 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
> ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock


> 创建容器时不能采用 Host 网络

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 --network dpanel-local \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -e APP_NAME=dpanel dpanel/dpanel:latest
```

##### 域名转发

DPanel 提供了基础的域名转发及 ssl 证书功能，不需要使用此功能或是服务器已经安装了 web 服务（宝塔等），去掉 80 及 443 端口配置即可。

```
docker run -it -d --name dpanel --restart=always \
 -p 8807:8080 --network dpanel-local \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -e APP_NAME=dpanel dpanel/dpanel:latest
```

##### 自定义面板名称

面板内部会获取 dpanel 的容器信息，如果创建时想更换其它名称，可以通过 APP_NAME 指定

```
docker run -it -d --name my-dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 --network dpanel-local \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -e APP_NAME=my-dpanel dpanel/dpanel:latest
```

#### 访问地址

```
http://127.0.0.1:8807
```

配置中的 -p 8807:8080 指定面板对外暴露的访问端口，可根据实际情况进行修改

#### 默认帐号 

admin / admin


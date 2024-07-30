# 使用 Docker 安装

> 国内镜像 ccr.ccs.tencentyun.com/dpanel/dpanel:latest


##### 创建容器

> macos 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
> ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock


> 创建容器时不能采用 Host 网络

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v dpanel:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

##### 自定义宿主机目录存储

面板会产生一些数据存储至容器内的 /dpanel 目录中，默认下此目录会挂载到docker的存储卷中

如果你想将此目录持久化到宿主机目录中，可以通过修改 -v 参数。

指定目录必须是绝对目录，目录不存在时会自动新建，例如：-v /root/dpanel:/dpanel 

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v 指定宿主机目录:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

##### 域名转发

DPanel 提供了基础的域名转发及 ssl 证书功能需要绑定 80 及 443 端口

服务器已经安装了宝塔或是Lucky等服务软件时，[请安装 Lite 版](/zh-cn/install/docker-lite)


##### 自定义面板名称

面板内部会获取 dpanel 的容器信息，如果创建时想更换其它名称，可以通过 APP_NAME 指定

```
docker run -it -d --name my-dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v dpanel:/dpanel -e APP_NAME=my-dpanel dpanel/dpanel:latest
```

##### 通过 tcp 连接 docker

面板请求 docker 服务时需要绑定宿主机的 /var/run/docker.sock 文件

你也可以开启 docker tcp 连接地址，并通过 DOCKER_HOST 环境变量指定

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -e DOCKER_HOST=tcp://172.16.1.13:2375
 -v dpanel:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

#### 访问地址

```
http://127.0.0.1:8807
```

配置中的 -p 8807:8080 指定面板对外暴露的访问端口，可根据实际情况进行修改

#### 默认帐号 

admin / admin


# 使用 Docker 安装

##### 新建 DPanel 默认网络

DPanel 转发域名到容器时，需要将目标容器放置到默认网络中，以 Hostname 的形式进行转发。

> 如果需要使用域名转发功能，请创建此网络。\
> 如果提示网络已经存在，请先删除 docker network rm dpanel-local

```
docker network create dpanel-local
```

##### 创建容器

> macos 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
> ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock

> 国内镜像地址 ccr.ccs.tencentyun.com/dpanel/dpanel:latest

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8808:8080 --network dpanel-local \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -e APP_NAME=dpanel dpanel/dpanel:latest
```

- 8807 指定面板对外暴露的访问端口，创建完成后通过 http://服务器Ip:8807 访问面板，可根据实际情况进行修改
- 当使用 DPanel 对容器进行域名绑定时，需要绑定暴露 80 及 443 端口
- 不需要 DPanel 进行转发时或是使用已有的 web 服务（宝塔等）进行转发可去掉此 80 及 443 端口配置
- 如果你更改了面板容器名称，请通过 APP_NAME 环境变量指定

#### 访问地址

```
http://127.0.0.1:8807
```

#### 默认帐号 

admin / admin


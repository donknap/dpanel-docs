# 使用 Docker 安装

##### 新建 DPanel 默认网络

DPanel 转发域名到容器时，需要将目标容器放置到默认网络中，以 Hostname 的形式进行转发。

> 如果需要使用域名转发功能，请创建此网络。

```
docker network create dpanel-local
```

##### 创建容器

> macos 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
> ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock

```
docker run -it -d --name dpanel1 --restart=always \
 -p 80:80 -p 443:443 -p 8808:8080 --network dpanel-local \
 -v /var/run/docker.sock:/var/run/docker.sock \
 donknap/dpanel:latest
```

- 8807 指定面板对外暴露的访问端口，创建完成后通过 http://服务器Ip:8807 访问面板，可根据实际情况进行修改
- 当使用 DPanel 对容器进行域名绑定时，需要绑定暴露 80 及 443 端口
- 不需要 DPanel 进行转发时或是使用已有的 web 服务（宝塔等）进行转发可去掉此 80 及 443 端口配置
- 国内镜像地址 ccr.ccs.tencentyun.com/donknap/dpanel:latest

##### 手动挂载目录

DPanel 的存储目录位于 /dpanel 目录中，通常情况下 docker 会自动新建存储卷绑定到此目录中。

如果你采用 -v 宿主机目录:/dpanel 的形式将目录挂载到宿主机上，需要手动新建一些目录，系统才可以正常运行。

> 下方命令中将 /dpanel 替换为你的宿主机目录

```
mkdir -p /dpanel/nginx/default_host /dpanel/nginx/proxy_host \
  /dpanel/nginx/redirection_host /dpanel/nginx/dead_host /dpanel/nginx/temp \
  /dpanel/nginx/cert /dpanel/storage
```

#### 访问地址

```
http://127.0.0.1:8807
```

#### 默认帐号 

admin / admin


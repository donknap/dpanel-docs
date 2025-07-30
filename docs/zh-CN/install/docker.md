# 通过命令创建

:::danger DPanel 面板为了隔离权限，在管理容器文件时，会自动创建 dpanel-plugin-explorer 容器。
此插件容器并不暴露任何端口，面板会在你关闭所有访问页面后自动销毁该容器。\
此插件容器使用 alpine 镜像，你也可以 [手动创建](/install/docker?id=手动创建文件管理插件)，名称保持为 dpanel-plugin-explorer 即可。\
如果你没有手动创建，面板会自动创建。如果你无法接受，请勿使用【文件管理】功能！！！！ 
:::

:::tip
MacOS 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
sudo ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock 

Windows 请在 wsl 中运行命令
:::

<br />

###### [:rocket::rocket::rocket: 使用一键安装脚本可快速安装、升级 DPanle 面板容器](/install/shell)

## 标准版

:::warning 阿里云镜像地址
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:latest \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:lite
:::

创建面板容器时，请根据实际情况修改映射端口。面板不能绑定 host 网络 <span style="color: red">（请勿使用 --network host 参数!!!）</span> \
标准版本中提供了域名绑定及证书功能，需要绑定 80 及 443 端口，如果你不需要这些功能，请使用 Lite 版。

```
docker run -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /home/dpanel:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

## Lite 版

:::tip
Lite版与标准版只有镜像地址区别，除不再需要映射 80 及 443 端口外，其余配置均一致。后续命令演示均以【标准版】为例，请自行替换镜像地址。
:::

```
docker run -d --name dpanel --restart=always \
 -p 8807:8080 -e APP_NAME=dpanel \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /home/dpanel:/dpanel dpanel/dpanel:lite
 ```

## Podman

Podman 与 Docker 命令兼容，将文档中面板创建命令中的 docker 替换成 podman 运行即可，例如：

```
podman run -d --name dpanel ...(省略其它参数)... dpanel/dpanel:latest
```

### Rootless

Podman 支持在非 root 用户权限管理容器. 在创建面板时，你需要在非 root 用户在激活该用户的 podman.sock 会话

```
systemctl --user enable --now podman.socket
```

将用户的 podman.sock 挂载至面板容器的 /var/run/docker.sock 文件即可。

```
podman run -d --name dpanel ...(省略其它参数)... -v /run/user/1000/podman/podman.sock:/var/run/docker.sock dpanel/dpanel:latest
```

## 挂载 docker.sock 文件

创建面板时需要挂载 docker.sock 文件用于与 Docker 接口通信。
如果你绑定的非默认 /var/run/docker.sock 文件或是运行在 Podman 中，你需要在参数中指定 sock 文件。

```
docker run -d --name dpanel ...(省略其它参数)... -v /Users/test/.docker/run/docker.sock:/var/run/docker.sock dpanel/dpanel:latest
```

### 获取当前环境的 sock 位置

在 Docker 环境中你可以使用以下命令查找 sock 文件

```
docker context inspect $(docker context show)  --format '{{.Endpoints.docker.Host}}'

# 输出当前环境的 sock 文件位置
# unix:///Users/test/.docker/run/docker.sock
```

在 Podman 环境中 Root 用户的文件位于 /run/podman/podman.sock，用户级别的位于 /run/user/{userid}/podman/podman.sock

### 通过 Docker Api 形式管理

如果你想通过 Docker Api 的形式管理 Docker，你可以创建面板容器时不挂载 /var/run/docker.sock 文件。

参考 [开启 docker tcp 连接方式](/manual/system/remote) 配置 Docker Tcp 连接。
在面板容器创建完后，通过【配置默认 docker 客户端】配置接口地址即可。

## 自定义面板访问端口

默认情况下安装完成面板后通过 http://127.0.0.1:8807 地址访问管理面板。\
你也可以通过 -p 参数，指定面板对外映射的访问端口

```
docker run -d --name dpanel ...(省略其它参数)... -p 访问端口:8080 dpanel/dpanel:latest
```

## 配置面板代理

创建面板时通过环境变量配置容器内的代理地址 \
如果代理地址为宿主机，请勿使用 127.0.0.1 或 localhost，这些地址指向的是容器本身而非宿主机，请使用宿主机局域网地址

```
docker run -d --name dpanel ...(省略其它参数)... -e HTTP_PROXY="http://代理地址:端口" -e HTTPS_PROXY="http://代理地址:端口" dpanel/dpanel:latest
```

## 自定义登录 jwt 密钥

:::danger
执行面板[控制命令](/install/ctrl)时必须配置此值，配置时请务必使用强密码。
:::

```
docker run -d --name dpanel  ...(省略其它参数)... -e DP_JWT_SECRET=强密码随机字符串  dpanel/dpanel:latest
```

## 自定义宿主机目录存储

:::tip
 如果需要挂载 compose yaml 文件或是在 compose yaml 中使用相对路径，请务必将挂载 /dpanel 目录到宿主机，在目录中新建 compose 任务查看 [创建 compose 任务](/manual/compose/create?id=通过挂载存储路径的方式创建)
:::

面板在运行时会产生一些数据，并存储在面板容器内的的 /dpanel 目录中。如果在创建时没有挂载该目录，docker 会自动生成该目录的存储卷 \
如果你想自定义挂载到宿主机的目录，可以通过修改 -v 参数。

指定目录必须是绝对目录，目录不存在时会自动新建，例如：-v /root/dpanel:/dpanel 

```
docker run -d --name dpanel  ...(省略其它参数)... -v 指定宿主机目录:/dpanel dpanel/dpanel:latest
```

## 配置面板管理员用户名密码

创建完成面板容器后，首次进入需要先配置管理员用户和密码。如果你忘记密码可以使用 [重置用户名密码](/install/ctrl?id=重置管理员用户)


## 独立运行

> 推荐你使用容器的方式创建面板，这样更具有兼容性。

面板也支持直接使用二进制的方式运行，你可以在创建面板后，再配置默认的 docker 连接客户端，[配置默认 Docker 服务端](/manual/setting/docker-env?id=配置默认-docker-环境)

## 自定义面板名称

> 面板默认使用 dpanel 做为容器名称 

如果你想更改面板容器名称或是同时安装多个面板，可以在安装命令中指定 APP_NAME 环境变量为指定的容器名称。

```
docker run -d --name dpanel-lite ...(省略其它参数)... -e APP_NAME=dpanel-lite dpanel/dpanel:lite
```

```
docker run -d --name dpanel-test ...(省略其它参数)... -e APP_NAME=dpanel-test dpanel/dpanel:latest
```

## 绑定宿主机 host

- 在面板容器内部可以通过 host.dpanel.host 访问主机，127.0.0.1 表示的是面板容器自身

```
docker run -d --name dpanel ...(省略其它参数)... --add-host=host.dpanel.local:host-gateway dpanel/dpanel:latest
```

## 更新或重建面板

更新与重建的区别就在于是否保留之前面板挂载的目录（/dpanel）数据。如果删除宿主机挂载目录或是重新指定目录，则为重建面板。
如果保留原挂载目录数据及挂载配置，重建面板容器则表示升级，[查看面板升级命令](/manual/setting/upgrade)

## 手动创建文件管理插件

在手动创建或是编辑文件管理插件容器时，指定容器标签 com.dpanel.container.auto_remove=true，则面板会在每次关闭浏览之后自动清理容器，配置为 false 时则不会清理。

```
docker run -it -d --name dpanel-plugin-explorer --restart always --pid host --label com.dpanel.container.title="dpanel 文件管理助手" --label com.dpanel.container.auto_remove=false alpine
```
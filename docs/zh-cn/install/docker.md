# 使用 Docker 安装

!> DPanel 面板为了隔离权限，在使用文件管理功能时需要使用 dpanel-plugin-explorer 容器。\
此插件容器并不暴露任何端口，面板会在你关闭所有访问页面后自动清理掉此容器。\
此插件容器使用 alpine 镜像，你也可以手动创建，名称保持为 dpanel-plugin-explorer 即可。\
如果你没有手动创建，面板会自动创建。如果你无法接受，请勿使用【文件管理】功能！！！！ \
如果想你保留此容器避免频繁的销毁创建，可以在创建时或是编辑该容器的标签 com.dpanel.container.auto_remove=false 即可。

?> DPanel 阿里云镜像地址 \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:latest \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:lite

> macos 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
> sudo ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock \

> windows 请在 wsl 中运行命令

#### 安装标准版

创建面板容器时，请根据实际情况修改映射端口。面板不能绑定 host 网络<span style="color: red">（请勿使用 --network host 参数!!!）</span> \
默认版本中提供了域名绑定及Https证书功能，需要绑定 80 及 443 端口。如果你不需要这些功能，请安装 Lite 版

```
docker run -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /home/dpanel:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

#### 安装 Lite 版

> 与标准版只有镜像地址区别，其它配置参数均一致。不需要绑定 80 及 443。后续配置均以【标准版】举例，请自行替换镜像

在 lite 版中，不包含域名转发功能。即容器内不会安装 nginx 及 acme.sh 等相关组件需要域名转发请借助外部工具。

```
docker run -d --name dpanel --restart=always \
 -p 8807:8080 -e APP_NAME=dpanel \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /home/dpanel:/dpanel dpanel/dpanel:lite
 ```

#### 挂载 docker.sock 文件

创建面板时需要挂载 docker.sock 文件用于与 docker 服务端通信，如果你的当前环境并非使用默认的 /var/run/docker.sock 文件，你可以在创建时指定 sock 文件挂载。

如果查找出的 sock 文件不正确，请手动查找出正确的 sock 文件地址挂载或是采用 tcp 的方式连接 docker。

##### 查看当前环境的 sock 位置

```
docker context inspect $(docker context show)  --format '{{.Endpoints.docker.Host}}'

# 输出当前环境的 sock 文件位置
# unix:///Users/test/.docker/run/docker.sock
```

##### 自定义挂载 sock 文件

```
docker run -d --name dpanel ...(省略其它参数)... -v /Users/test/.docker/run/docker.sock:/var/run/docker.sock dpanel/dpanel:latest
```

#### 通过 tcp 管理 docker

如果无法找到 docker.sock 文件，你也可以通过查看 systemctrl status docker 查看当前 docker 是否开启 tcp 连接。

```
# systemctl status docker 

● docker.service - Docker Application Container Engine
     CGroup: /system.slice/docker.service
             ├─ 964 /usr/bin/dockerd -H 0.0.0.0:2375 -H fd:// --containerd=/run/containerd/containerd.sock

```

上面的输出内容中 0.0.0.0:2375 为 docker 的 tcp 连接地址，注意需要把 0.0.0.0 替换为你主机的内网地址。如果你的输出中未包含类似的信息。
你可以参考 [开启 docker tcp 连接方式](zh-cn/manual/system/remote) 配置 tcp 连接。

创建完成面板后，通过 【配置默认 docker 客户端】配置 docker 管理地址即可。

 #### 自定义面板访问端口

默认情况下安装完成面板后通过 http://127.0.0.1:8807 地址访问管理面板。\
你也可以通过 -p 参数，指定面板对外暴露的访问端口

```
docker run -d --name dpanel ...(省略其它参数)... -p 访问端口:8080 dpanel/dpanel:latest
```

#### 配置面板代理

创建面板时通过环境变量配置容器内的代理地址 \
如果代理地址为宿主机，请勿使用 127.0.0.1 或 localhost，这些地址指向的是容器本身而非宿主机，请使用宿主机局域网地址

```
docker run -d --name dpanel ...(省略其它参数)... -e HTTP_PROXY="http://代理地址:端口" -e HTTPS_PROXY="http://代理地址:端口" dpanel/dpanel:latest
```

#### 自定义登录 jwt 密钥

> 需要在计划任务中使用面板的【[控制命令](/zh-cn/install/ctrl)】必须配置此值，配置时请务必使用强密码。

```
docker run -d --name dpanel  ...(省略其它参数)... -e DP_JWT_SECRET=强密码随机字符串  dpanel/dpanel:latest
```

#### 自定义宿主机目录存储

> 如果需要挂载 compose yaml 文件或是在 compose yaml 中使用相对路径，请务必将挂载 /dpanel 目录到宿主机，在目录中新建 compose 任务查看 [创建 compose 任务](zh-cn/manual/compose/create?id=通过挂载存储路径的方式创建)

面板会产生一些数据存储至容器内的 /dpanel 目录中，如果不指定该目录的挂载目录，默认会挂载到 docker 的存储卷中 \
如果你想自定义挂载到宿主机的目录，可以通过修改 -v 参数。

指定目录必须是绝对目录，目录不存在时会自动新建，例如：-v /root/dpanel:/dpanel 

```
docker run -d --name dpanel  ...(省略其它参数)... -v 指定宿主机目录:/dpanel dpanel/dpanel:latest
```

#### 配置面板管理员用户名密码

创建完成面板容器后，首次进入需要先配置管理员用户和密码。如果你忘记密码可以使用 [重置用户名密码](/zh-cn/install/ctrl?id=重置管理员用户)


#### 独立运行

> 通常情况下，推荐你使用容器的方式创建面板，这样更具有兼容性。

面板也支持直接使用二进制的方式并且脱离 docker 环境的方式运行。你可以在创建面板后，再配置默认的 docker 连接客户端，[【独立运行 DPanel 面板】](/zh-cn/install/source?id=启动)

#### 自定义面板名称

> 面板默认使用 dpanel 做为容器名称 

如果你想更改面板容器名称或是同时安装多个面板，可以在安装命令中指定 APP_NAME 环境变量为指定的容器名称。

```
docker run -d --name dpanel-lite ...(省略其它参数)... -e APP_NAME=dpanel-lite dpanel/dpanel:lite
```

```
docker run -d --name dpanel-test ...(省略其它参数)... -e APP_NAME=dpanel-test dpanel/dpanel:latest
```

#### 更新或重建面板

更新与重建的区别就在于是否保留之前面板挂载的目录（/dpanel）数据。\
如果删除宿主机挂载目录或是重新指定目录，则为重建面板。

更新面板则等价于保留挂载目录或是挂载存储卷，重建面板容器。[升级面板](/zh-cn/manual/setting/upgrade)
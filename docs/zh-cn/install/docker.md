# 使用 Docker 安装

!> DPanel 面板为了隔离权限，在使用文件管理功能时需要使用 dpanel-plugin-explorer 容器。此插件容器并不暴露任何端口，你也可以随时删除。\
此插件容器使用 alpine 镜像，你也可以手动创建，名称保持为 dpanel-plugin-explorer 即可。\
如果你没有手动创建，面板会自动创建。如果你无法接受，请勿使用【文件管理】功能！！！！

?> 阿里云加速镜像地址 \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:latest \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:lite


#### 安装标准版

> macos 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
> ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock \

创建面板容器时，请根据实际情况修改映射端口。面板不能绑定 host 网络<span style="color: red">（请勿使用 --network host 参数!!!）</span> \
默认版本中提供了域名绑定及Https证书功能，需要绑定 80 及 443 端口。如果你不需要这些功能，请安装 Lite 版

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v dpanel:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

#### 安装 Lite 版

在 lite 版中，不包含域名转发功能。即容器内不会安装 nginx 及 acme.sh 等相关组件

需要域名转发请借助外部工具，例如 NginxProxyManager、Lucky、宝塔、Nginx等

> 与普通版只有镜像地址区别，其它配置参数均一致。不需要绑定 80 及 443。后续配置均以默认版举例，请自行替换镜像

```
docker run -it -d --name dpanel --restart=always \
 -p 8807:8080 -e APP_NAME=dpanel \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v dpanel:/dpanel dpanel/dpanel:lite
 ```

#### 自定义宿主机目录存储

面板会产生一些数据存储至容器内的 /dpanel 目录中，默认下此目录会挂载到 docker 的存储卷中

如果你想将此目录持久化到宿主机目录中，可以通过修改 -v 参数。

指定目录必须是绝对目录，目录不存在时会自动新建，例如：-v /root/dpanel:/dpanel 

> 如果需要挂载 compose yaml 文件，请挂载 /dpanel 目录挂载到宿主机目录，方便管理文件。[创建 compose 任务](zh-cn/manual/compose/create?id=通过挂载存储路径的方式创建)

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v 指定宿主机目录:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```


#### 配置面板管理员用户名密码

创建完成面板容器后，首次进入需要先配置管理员用户和密码。如果你忘记密码可以使用 [重置用户名密码](/zh-cn/install/ctrl?id=重置管理员用户)


#### 通过 tcp 管理 docker

创建面板时需要挂载 docker 的 /var/run/docker.sock 文件，用于请求 docker API。

你也可以开启 docker tcp 连接地址，并通过 DOCKER_HOST 环境变量创建面板。[开启 docker tcp 连接方式](zh-cn/manual/system/remote)

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -e DOCKER_HOST=tcp://172.16.1.13:2375 \
 -v dpanel:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

#### 自定义面板名称

面板内部会获取 dpanel 的容器信息，在创建时必须使用 dpanel 名称。

如果你想更改创建的容器名称，必须再指定 APP_NAME 环境变量，请保证 APP_NAME 环境变量与面板容器名称一致。

```
docker run -it -d --name my-dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v dpanel:/dpanel -e APP_NAME=my-dpanel dpanel/dpanel:latest
```

#### 更新或重建面板

更新与重建的区别就在于是否保留之前面板挂载的目录（/dpanel）数据。\
如果删除宿主机挂载目录或是重新指定目录，则为重建面板。

更新面板则等价于保留挂载目录或是挂载存储卷，重建面板容器。[升级面板](/zh-cn/manual/setting/upgrade)

#### 访问地址

```
http://127.0.0.1:8807
```

配置中的 -p 8807:8080 指定面板对外暴露的访问端口，可根据实际情况进行修改


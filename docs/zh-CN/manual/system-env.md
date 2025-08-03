# 多服务端管理

DPanel 支持同时管理多个 Docker、Podman 服务端，支持 Sock 文件、Api、SSH 多种形式添加。

## 添加环境

【系统】- 【多服务端】-【添加服务端】。

![system-docker-env-add.png](https://cdn.w7.cc/dpanel/system-docker-env-add.png?t=7){data-zoomable}

### 通过 Api 添加

使用 Api 添加服务端时，需要先[开启 Docker Tcp 连接](/manual/system-env-tcp)。如果添加的是公网地址，必须同时[开启 TLS 连接](/manual/system-env-tcp#tls)。
填入 Docker Api 地址，例如：

```
tcp://192.168.0.5:2375
```

### 通过 SSH 添加

使用主机 SSH 权限管理远程 Docker 服务端可以避免繁琐的配置证书的过程。

#### 版本一致

使用 SSH 方式时，需要保证目标主机的 docker 版本与面板的 docker sdk 版本一致。如果无法保证版本一致请使用 API 的添加方式。

:::code-group
```shell [版本不匹配错误信息]
Docker 服务端连接失败，请升级目标
Docker 版本 Error response from daemon: client version 1.48 is too new. Maximum
supported API version is 1.43
```
:::

#### SSH 用户

请配置非 root 的 SSH 登录用户，并追加 docker 用户组。

:::code-group
```shell [命令]
sudo usermod -aG docker 用户名
```

```shell [编辑/etc/group文件]
... 其它组信息 ...
docker:x:994:用户名1,追加用户名
... 其它组信息 ...
```
:::

增加用户组后，可以切换至目标用户并执行一条 docker 命令，正常输出即表示添加成功。

```
docker ps
```

## 切换不同的环境

通过顶部菜单切换不同的 Docker 客户端

## 启用独立 Compose 目录 {#enable-compose-path}

启用独立 Compose 目录后，挂载的 Compose 任务文件只会显示当前服务端的私有任务，存放的目录为：

```shell
/dpanel/compose-服务端标识
```

## 配置默认服务端 {#setting-default-env}

当创建面板容器时未指定 /var/run/docker.sock 文件或是默认环境为远程服务端。
可以通过修改默认服务端（标识为 local）更改连接参数。

当默认服务端无法连接时，可以通过【概览】-【配置默认 Docker 客户端】来修改默认服务端。

![system-docker-env-default.png](https://cdn.w7.cc/dpanel/system-docker-env-default.png)

## 配置服务端访问 ip {#server-url}

默认情况下面板会自动获取当前浏览器的地址或是当前服务端的连接参数自动拼接端口访问地址。
如果你想更改端口访问地址，通过配置【容器端口访问域名】自定义访问地址。
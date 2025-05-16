# 多环境管理

在 DPanel 中可以通过 docker api、docker.sock 以及 ssh 的形式管理多个 Docker 客户端。

### 添加环境

【系统】- 【客户端管理】-【添加Docker环境】。

![system-docker-env-add.png](https://cdn.w7.cc/dpanel/system-docker-env-add.png?t=7)

#### 通过 docker api 添加

通过 docker api 管理远程主机时，需要先将远程主机开启 tcp 监听模式。如果该主机暴露在公网内，必须同时开启 TLS 模式。
[开启 docker 远程连接](zh-cn/manual/system/remote.md)

#### 通过 SSH 添加

面板同时也支持通过 SSH 权限管理远程 docker 服务端。通过这样的试可以避免繁琐的配置证书的过程。
在添加 SSH 权限时，请使用非 root 帐号，并将该帐号添加 docker 用户组。

将用户添加 docker 用户组时可编辑 /etc/group 文件，在 docker 组后增加用户。

```
... 其它组信息 ...
docker:x:994:用户名1,用户名2
... 其它组信息 ...
```

使用命令添加 docker 用户组

```
sudo usermod -aG docker 用户名
```

### 切换不同的环境

添加完成后，可以顶部菜单切换不同的 Docker 客户端

### 开启独立 Compose 目录

面板允许给每个客户端配置独立的 compose 目录，目录规则为 /dpanel/compose-环境标识。


### 配置默认 Docker 环境

> 通过这样的方式，你可以不必将面板安装到你远程服务器主机中，严格杜绝了因为面板产生的安全问题。

初次安装面板之后，面板会读取 /var/run/docker.sock 文件连接 docker API。
假如你当前环境未安装 docker 或是连接 sock 文件不是默认路径。可以通过【配置默认 Docker 客户端】来修改默认 docker 连接。

![system-docker-env-default.png](https://cdn.w7.cc/dpanel/system-docker-env-default.png)


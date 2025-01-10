# 配置镜像仓库

对于匿名用户，具有在 docker hub 仓库拉取镜像的权限。

但是如果你想推送镜像到 docker hub 或是使用附带权限的仓库时，需要添加对应的仓库并配置用户名及密码。\
通过 docker login 命令配置的仓库用户名密码并不会在面板中生效，需要重新配置。

当你遇到以下错误时也需要配置仓库的权限。

```
Error response from daemon: 
pull access denied for registry.cn-hangzhou.aliyuncs.com/****/, 
repository does not exist or may require 'docker login': 
denied: requested access to the resource is denied
```

### docker hub

默认下，DPanel 面板会自动创建 docker hub 仓库的记录，并设置为匿名用户。

如果你有推送镜像的需求，可在以添加或是编辑仓库，配置用户名和密码。

### 添加其它仓库

##### 阿里云

仓库地址：registry.cn-beijing.aliyuncs.com

##### 腾讯云

仓库地址：ccr.ccs.tencentyun.com

![registry-create](https://cdn.w7.cc/dpanel/registry-create.png)

### 仓库加速

> 采用面板配置加速地址不需要修改 docker 的 daemon.json 文件，也无需启动服务，配置后即生效。

如果需要拉取镜像加速，需要先将镜像所属的【仓库】添加到仓库管理中，并配置【加速地址】。\
配置加速地址时可以配置多条数据，一行一条加速地址，面板会采用轮询的方式进行拉取。

通过加速地址拉取镜像后，面板会给该镜像添加两个 tag，一个为原始的名称，一个为包含加速地址的标签。\
以便于你区分哪些加速地址已经失效。在使用时，建议还是使用原始的 tag 名称。

#### 多种仓库

配置镜像加速时，需要区分于不同的仓库。比如通过 docker 官方拉取镜像时你需要配置 docker.io 的加速。\
通过 ghcr.io 拉取时，你需要添加 ghcr.io 仓库及加速地址。

在 docker.io 中配置的加速只适用于 docker.io 这一个仓库。

#### 加速无法在命令行生效

面板的加速地址并未修改 docker 的 daemon.json 文件，所以在面板中配置的加速地址并不会在 docker pull 命令中生效。
所有需要拉取镜像的操作需要在面板中完成。

# 镜像仓库管理

当从镜像仓库拉取镜像时，如果没有指定仓库地址例如：dpanel/dpanel 则是通过 Docker Hub 拉取。
指定了仓库地址例如：registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel 则是从阿里云的仓库拉取。

对于大多数具有匿名拉取权限的镜像仓库是不需要添加仓库的，直接在镜像地址中指定仓库地址即可。
对于一些具的权限的仓库或是想推送镜像时，需要在镜像仓库中添加仓库并配置权限。

:::code-group
```shell [仓库无权限错误信息]
Error response from daemon: 
pull access denied for registry.cn-hangzhou.aliyuncs.com/****/, 
repository does not exist or may require 'docker login': 
denied: requested access to the resource is denied
```
:::

:::danger
通过 docker login 命令配置的仓库用户名密码并不会在面板中生效，需要重新配置。
:::

## 添加仓库

![registry-create](https://cdn.w7.cc/dpanel/registry-create.png){data-zoomable}

### Docker Hub

DPanel 面板会自动创建 Docker hub 仓库的记录，并设置为匿名用户。

### 本地仓库

本地自建 Registry 仓库，需要开启使用 Http 协议，并在 daemon.json 中配置 insecure-registries 开启该仓库的 http 连接。

### 阿里云

仓库地址：registry.cn-beijing.aliyuncs.com

### 腾讯云

仓库地址：ccr.ccs.tencentyun.com

### GitHub

仓库地址：ghcr.io

### Rea Hat

仓库地址：quay.io

## 加速地址

:::tip
为仓库配置加速地址时，加速地址仅对当前仓库生效。
:::

加速地址时可以配置多条数据，一行一条地址。面板会采用轮询的方式进行拉取。

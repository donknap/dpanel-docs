# 安装脚本

安装脚本是通过向导模式，生成并运行创建面板容器的 docker run 或 podman run 命令。

:::danger 安装脚依赖
在使用安装脚前，确保系统中包含 bash、curl 命令，使用 apt、yum、apk 等包管理工具安装依赖
:::

## 没有 Docker ?

:::tip 
如果你想使用 Podman 做为容器管理客户端，请在运行安装脚本之前自行安装 
:::

当宿主机没有 Docker 和 Podman 环境时，安装脚本会通过 https://get.docker.com 脚本安装 Docker。\
脚本在 Debian、Ubuntu、Alpine 发行版下通过测试，推荐使用 Debian。

当脚本无法正常安装 Docker 环境时，请手动安装 Docker 或是 Podman。

## 升级面板

你可以使用安装脚对当前系统已经安装的面板容器进行升级

运行安装脚本后，指定想要升级的面板容器名称后。
脚本会停止、备份旧容器，使用容器的原有配置和使用最新的镜像创建面板容器。


## 使用

### 非 root

```
sudo curl -sSL https://dpanel.cc/quick.sh -o quick.sh && sudo bash quick.sh
```

### root 或是 Podman

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh
```

## 调试模式

仅输出创建命令

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh test

```

## 生成 Docker Api TLS 证书

使用安装脚本生成 Docker Api TLS 证书后根据 [开启 Docker TCP 远程连接](/manual/system/remote.md) 配置证书。

## 预览

![install-1](https://cdn.w7.cc/dpanel/install-1.png?t=1)
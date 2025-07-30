# 一键安装脚本

集成脚本是通过向导模式，生成并运行创建面板容器的 docker run 或 podman run 命令。

##### 请先安装 curl

```
apt update && apt install curl
```

##### Alpine 系统下请先安装 bash、curl

```
apk update && apk add bash curl
```

## 安装 Docker ?

:::tip 
如果你想使用 Podman 做为容器管理客户端，请在运行安装脚本之前自行安装 
:::

当宿主机没有 Docker 和 Podman 环境时，集成脚本会尝试通过 https://get.docker.com 官方脚本安装 Docker。\
脚本在 Debian、Ubuntu、Alpine 发行版下通过测试，推荐使用 Debian。

当脚本无法正常安装 Docker 环境时，请手动安装 Docker 或是 Podman。

## 升级面板

一键脚本也支持对当前环境中已经存在的面板容器进行升级。

在运行安装脚本后，指定想要升级的面板容器名称，脚本会停止、备份旧容器，保持原有配置创建新的面板容器。


## 使用

### 非 root

```
sudo curl -sSL https://dpanel.cc/quick.sh -o quick.sh && sudo bash quick.sh
```

### root 或是 podman

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh
```

## 调试模式

仅输出创建命令

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh test

```

## 生成 Docker Api TLS 证书

采用安装脚本生成 Docker Api TLS 证书后查看 [开启 Docker TCP 远程连接](/manual/system/remote.md) 配置证书。

## 预览

![install-1](https://cdn.w7.cc/dpanel/install-1.png?t=1)
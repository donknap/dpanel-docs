# 一键安装脚本

集成脚本是通过向导模式，生成并运行创建面板容器的 docker run 或 podman run 命令。

- Alpine 系统下请先安装 bash

```
apk add bash
```
- 

### 安装 Docker

> 如果你想使用 podman 做为容器管理客户端，请在运行安装脚本之前自行安装

当宿主机没有 Docker 和 Podman 环境时，集成脚本会尝试通过 https://get.docker.com 官方脚本安装 Docker 环境。\
脚本在 Debian、Ubuntu、Alpine 发行版下通过测试，推荐使用 Debian。

当脚本无法正常安装 Docker 环境时，请确保在运行脚本之前宿主机已经正常安装 Docker 环境。

### 升级面板

运行集成脚本时，如果指定的容器名称当前环境已经存在。脚本则会执行【升级】逻辑。旧容器会停止并备份。


### 使用

#### 非 root 用户

```
sudo curl -sSL https://dpanel.cc/quick.sh -o quick.sh && sudo bash quick.sh
```

#### root 用户 或是 podman

> 当前使用的 root 用户或是提示 sudo: command not found

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh
```

#### 调试模式

仅输出创建命令

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh test
```

### 预览

![install-1](https://cdn.w7.cc/dpanel/install-1.png?t=1)
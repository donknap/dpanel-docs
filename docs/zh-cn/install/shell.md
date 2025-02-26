# 集成安装脚本

集成安装脚本是采用 Docker 容器的方式部署及升级面板。

- Alpine 系统下请先安装 bash， apk add bash

### 安装 Docker

当宿主机没有 Docker 环境时，集成脚本会尝试通过 https://get.docker.com 官方脚本安装 Docker 环境。\
脚本在 Debian、Ubuntu、Alpine 发行版下通过测试，推荐使用 Debian。

当脚本无法正常安装 Docker 环境时，请确保在运行脚本之前宿主机已经正常安装 Docker 环境。

### 升级面板

运行集成脚本安装时，如果指定的容器名称当前环境已经存在。脚本则会执行【升级】逻辑。旧容器会停止并备份。


### 使用

```
sudo curl -sSL https://dpanel.cc/quick.sh -o quick.sh && sudo bash quick.sh
```

### 预览

![install-1](https://cdn.w7.cc/dpanel/install-1.png?t=1)
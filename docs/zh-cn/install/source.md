# 独立运行

dpanel 面板允许不依赖容器，直接通过二进制包的方式运行。

### 下载二进制包

你可以在仓库的 Release 页面中找到你使用系统平台的二进制包，[https://github.com/donknap/dpanel/releases](https://github.com/donknap/dpanel/releases)

> 通过源码编译的方式编译运行的是 dpanel-lite 版，不包含域名转发等相关功能

##### 适用于 ubuntu, centos 等主流发行版

- dpanel-amd64 
- dpanel-arm
- dpanel-arm64

##### 适用于 apline 等使用 musl 库的发行版 
- dpanel-musl-amd64
- dpanel-musl-arm64
- dpanel-musl-arm

##### 适用于 macosx 

- dpanel-darwin-ARM64
- dpanel-darwin-X64

##### 适用于群晖

- dpanel-synology-arm64 
- dpanel-synology-amd64 

##### 适用于 windows

- dpanel.exe 


### 编译 DPanel 源码

如果在 Release 页面并未提供你所适用的平台，你也可以通过自行编译源码的方式构建二进制包。

##### 本机环境

> Go Version >= 1.23

编译源码前，请确保你已经有了 go 语言的运行环境，通过 go version 查看环境版本

```
go version
### go version go1.23.4 linux/amd64
```

```
go version
### go version go1.23.4 windows/amd64
```

```
docker run -it --rm --name dpanel-compile golang:latest go version
#### go version go1.23.4 linux/amd64
```

#### 编译源码

###### 下载源码并切至源码目录

```
git clone https://github.com/donknap/dpanel.git
cd dpanel
```

###### make 

> 请确保已经正确安装 libc，alpine 系统需要安装 musl

```
make build PROJECT_NAME=dpanel CGO_ENABLED=1 VERSION=1.5.0
```

###### windows 

> 需要安装 MinGW https://winlibs.com/#download-release 并配置到环境变量中

```
set CGO_ENABLED=1
go build -ldflags '-X main.DPanelVersion=1.5.0 -s -w' -o runtime/dpanel.exe
```

### 启动

> 运行相关配置可直接修改 config.yaml 中
> 也可以在运行程序时，指定 config.yaml 中定义的环境变量值

```
./runtime/dpanel server:start -f config.yaml
```

```
// 修改运行端口为 8807，其它环境变量可查看 config.yaml 
export APP_SERVER_PORT=8807 && ./runtime/dpanel server:start -f config.yaml
```

### 当前环境未安装 docker

独立运行 DPanel 时，会自动连接当前默认的的 Docker Engine 接口。
在 linux 系统下为 /var/run/docker.sock，在 windows 下为 //./pipe/docker_engine。

#### 安装 docker-cli 命令

DPanel 部分功能依赖于 docker、docker compose (docker-compose) 命令。
如果你未安装 docker engine 需要手动安装这些客户端命令组件, 根据使用的系统 [添加 Docker 软件源](https://docs.docker.com/engine/install/debian/)。

安装 docker-cli 客户端命令组件。

```
# Debian 系统

sudo apt install docker-ce-cli docker-compose-plugin
```

启动面板后通过[多环境管理](zh-cn/manual/setting/docker-env.md)功能，配置默认 docker 环境。

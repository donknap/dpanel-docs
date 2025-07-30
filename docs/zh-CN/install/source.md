# 独立运行

DPanel 面板同样支持直接使用二进制的方式运行，你可以通过 [Release](https://github.com/donknap/dpanel/releases) 页面下载已经打包好的二进制包。
如果你当前使用的系统并不适用，你也可以源码自行编译二进制包。

> 通过二进制包运行 DPanel 等价于 Lite 版，不包含域名转发等相关功能

##### 适用于 Ubuntu Centos Debian 等主流发行版

- dpanel-amd64 
- dpanel-arm
- dpanel-arm64

##### 适用于 Apline 等使用 Musl 库的发行版 
- dpanel-musl-amd64
- dpanel-musl-arm64
- dpanel-musl-arm

##### 适用于 MacOS 

- dpanel-darwin-ARM64
- dpanel-darwin-X64

##### 适用于群晖

- dpanel-synology-arm64 
- dpanel-synology-amd64 

##### 适用于 Windows

- dpanel.exe 

### 编译 DPanel

##### 环境要求

- Go Version >= 1.23
- 请确保已经正确安装 Libc or Musl，并将 CC CXX 配置到环境变量中
- Windows 系统需要安装 [MinGW](https://winlibs.com/#download-release) 

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

##### 下载源码并切至源码目录

```
git clone https://github.com/donknap/dpanel.git
cd dpanel
```

##### 使用 make 命令编译 

> 1.5.0 替换为实际的版本号，会在首页系统信息中显示

```
make build PROJECT_NAME=dpanel CGO_ENABLED=1 VERSION=1.5.0
```

##### 使用 go build 编译 

###### Windows

```
set CGO_ENABLED=1
go build -ldflags '-X main.DPanelVersion=1.5.0 -s -w' -o runtime/dpanel.exe
```

###### Linux 

```
CGO_ENABLED=1 go build -ldflags '-X main.DPanelVersion=1.5.0 -s -w' -o runtime/dpanel
```

### 运行

> 运行相关配置可直接修改 config.yaml 中
> 也可以在运行程序时，指定 config.yaml 中定义的环境变量值

通过二进制运行 DPanel 面板时，会自动连接当前默认的的 Docker 服务端。
在 Linux 系统下为 /var/run/docker.sock，在 Windows 下为 //./pipe/docker_engine。

```
chmod 755 ./runtime/dpanel
./runtime/dpanel server:start -f config.yaml
```

```
# Windows PowerShell
 .\dpanel.exe server:start -f .\config.yaml
```

### 当前环境未安装 docker

如果当前运行系统中并未安装 Docker 时，在启动面板后，可以通过 [多环境管理](/manual/setting/docker-env.md) 功能配置默认的远程 Docker 服务端。

#### 安装 docker-cli 命令

DPanel 部分功能依赖于 docker、docker compose (docker-compose) 命令。
如果你未安装 Docker 服务端时需要手动安装 Docker 客户端组件, 根据使用的系统 [添加 Docker 软件源](https://docs.docker.com/engine/install/debian/)。

安装 docker-cli 客户端命令组件。

```
# Debian 系统

sudo apt install docker-ce-cli docker-compose-plugin
```
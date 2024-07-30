### 源码安装

通过源码编译的方式编译运行的是 dpanel-lite 版，不包含域名转发等相关功能

#### 编译环境

##### 本机环境

编译源码前，请确保你已经有了 go 语言的运行环境，通过 go version 查看环境版本

```
root@513220d36158:/go# go version
go version go1.22.5 linux/amd64
```

##### 通过容器创建编译环境

> 可通过挂载目录或是 docker cp 的方式导出编译结果

```
docker run -it --rm --name dpanel-compile golang:latest
```

#### 编译源码

```
git clone https://github.com/donknap/dpanel.git
cd dpanel
make build GO_TARGET_DIR=/root
```

- 编译需要开启 cgo，请确保已经正确安装 libc，Alpine 系统需要安装 musl
- 可通过 GO_TARGET_DIR 指定编译的目标目录


#### 启动命令

> 运行相关配置可在 config.yaml 中配置或是指定环境变量

```
/root/dpanel server:start -f /root/config.yaml
```

```
// 修改运行端口为 8807，其它环境变量可查看 config.yaml 
export APP_SERVER_PORT=8807 && /root/dpanel server:start -f /root/config.yaml
```

# 使用 Docker 安装

> macos 下需要先将 docker.sock 文件 link 到 /var/run/docker.sock 目录中 \
> ln -s -f /Users/用户/.docker/run/docker.sock /var/run/docker.sock

```
docker run -it -d --name dpanel -p 8807:80 -v /var/run/docker.sock:/var/run/docker.sock donknap/dpanel:latest
```

- 8807 指定对外暴露的端口，可根据实际情况进行修改
- 国内镜像地址 ccr.ccs.tencentyun.com/donknap/dpanel:latest

#### 访问地址

```
http://127.0.0.1:8807
```

#### 默认帐号 

admin / admin


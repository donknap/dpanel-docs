# 创建单容器

> 单容器是指不需要关联其它容器可独立运行的应用。

这里以 Minio 为例，演示如何通过镜像创建一个应用容器。

### 配置

创建 Minio 时候，暴露 9000 和 9001 端口，并配置启动 cmd 命令为 

```
server /data --console-address :9001
```

### 访问

使用 http://127.0.0.1:9001 进行访问

默认用户为 minioadmin / minioadmin

# 演示

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112484158931712&bvid=BV1MfgcehEZy&cid=500001554797263&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
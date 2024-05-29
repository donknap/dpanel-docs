# 通过 Zip & Git 构建镜像

通过 Zip 包和 Git 仓库构建镜像，原理是一样的。

区别在于 Git 可以更好的进行可持续化构建，而 Zip 包更适合简单快带的构建。

### 示例

> https://github.com/donknap/dpanel-image

#### Dockerfile 

```
FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache --update nginx musl sqlite

WORKDIR /home
VOLUME [ "/dpanel" ]

ENV DOCKER_HOST=unix:///var/run/docker.sock
ENV DB_DATABASE=/dpanel/dpanel.db

EXPOSE 8806
EXPOSE 80

COPY ./src/server /home/server
COPY ./src/html /home/html
COPY ./src/nginx/default.conf /etc/nginx/http.d/default.conf
COPY ./src/entrypoint.sh /docker/entrypoint.sh

ENTRYPOINT [ "sh", "/docker/entrypoint.sh" ]
```

在 DPanel 构建仓库中，Dockerfile 位于根目录中，则构建目录为 ./ 。

引用配置文件时，也需要从 ./ 目录开始

假如你的 Dockerfile 位于某个子目录中，可以通过 **构建目录** 进行指定。

> 需要注意的是，即使 Dockerfile 位于子目录中，在使用 COPY ADD 命令时还是从根目录开始 \
> 构建目录仅可以指定 Dockerfile 的位置

### 持续构建

使用 Git 方式进行构建镜像的时候，可以通过 webhook 进行自动触发构建（暂未支持）。


### 演示

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112522626008832&bvid=BV19EKdemEwT&cid=500001563889069&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
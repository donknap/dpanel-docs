# 自定义面板镜像

基于 DPanel 提供的镜像，你可以添加一些个性化的运行环境或是脚本，构建个性化的镜像

<!--@include: ../include/image.md-->

## Dockerfile

:::code-group

```标准版
FROM dpanel/dpanel:latest

# 添加或是复制脚本或是文件
# COPY source target

# 使用 apk add 安装包
RUN apk add python3 

# 通过 RUN 运行其它脚本
RUN ls -al

ENTRYPOINT [ "/docker/entrypoint.sh" ]
```

```Lite 版
FROM dpanel/dpanel:lite

# 添加或是复制脚本或是文件
# COPY source target

# 使用 apk add 安装包
RUN apk add python3 

# 通过 RUN 运行其它脚本
RUN ls -al

ENTRYPOINT [ "sh", "-c", "/app/server/dpanel server:start -f /app/server/config.yaml" ]
```
:::

## 构建镜像

```shell
docker build -t my-dpanel .
```
# 自定义面板镜像

基于 DPanel 提供的镜像，你可以添加一些个性化的运行环境或是脚本，定义 Dockerfile 如下：

?> 无法访问 Docker Hub 将 FROM 镜像地址改为阿里云镜像 \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:latest \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:lite

### 标准版扩展

```
FROM dpanel/dpanel:latest

# 添加或是复制脚本或是文件
# COPY source target

# 使用 apk add 安装包
RUN apk add python3 

# 通过 RUN 运行其它脚本
RUN ls -al

ENTRYPOINT [ "/docker/entrypoint.sh" ]
```

### Lite 版扩展

```
FROM dpanel/dpanel:lite

# 添加或是复制脚本或是文件
# COPY source target

# 使用 apk add 安装包
RUN apk add python3 

# 通过 RUN 运行其它脚本
RUN ls -al

ENTRYPOINT [ "sh", "-c", "/app/server/dpanel server:start -f /app/server/config.yaml" ]
```

### 构建镜像

```
docker build -t my-dpanel .
```
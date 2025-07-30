# 自定义面板镜像

根据 dpanel 面板的镜像，添加一些自己的运行环境或是脚本。定义 Dockerfile 如下：

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
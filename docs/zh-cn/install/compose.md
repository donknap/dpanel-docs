# 通过 compose 方式创建

?> 阿里云加速镜像地址 \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:latest \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:lite

#### 标准版

```
services:
  dpanel:
    image: dpanel/dpanel:latest
    container_name: dpanel # 更改此名称后，请同步修改下方 APP_NAME 环境变量
    restart: always
    ports:
      - 80:80
      - 443:443
      - 8807:8080 # 替换 8807 可更改面板访问端口
    environment:
      APP_NAME: dpanel # 请保持此名称与 container_name 一致
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /home/dpanel:/dpanel # 将 /home/dpanel 更改为你想要挂载的宿主机目录
    networks:
      - dpanel-local
    networks:
      dpanel-local:
        driver: bridge
```

#### Lite 版

```
services:
  dpanel:
    image: dpanel/dpanel:lite
    container_name: dpanel # 更改此名称后，请同步修改下方 APP_NAME 环境变量
    restart: unless-stopped
    ports:
      - 8807:8080 # 替换 8807 可更改面板访问端口
    environment:
      APP_NAME: dpanel # 请保持此名称与 container_name 一致
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /home/dpanel:/dpanel # 将 /home/dpanel 更改为你想要挂载的宿主机目录
```

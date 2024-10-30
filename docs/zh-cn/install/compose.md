# 通过 compose 方式创建

!> 阿里云镜像 \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:latest \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:lite

```
services:
  dpanel:
    image: dpanel/dpanel:latest
    container_name: dpanel # 更改此名称后，请同步修改下方 APP_NAME 环境变量
    restart: always
    ports:
      - 80:80
      - 443:443
      - 8807:8080
    environment:
      APP_NAME: dpanel # 请保持此名称与 container_name 一致
      INSTALL_USERNAME: admin
      INSTALL_PASSWORD: admin
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - dpanel:/dpanel
  dpanel-plugin-explorer: # 该镜像为 dpanel 的文件浏览器,隔离特权
    image: alpine:latest
    container_name: dpanel-plugin-explorer
    restart: unless-stopped
    privileged: true
    pid: host
    command: ["sh", "-c", "tail -f /dev/null"]
```

#### lite 版

```
services:
  dpanel:
    image: dpanel/dpanel:lite
    container_name: dpanel # 更改此名称后，请同步修改下方 APP_NAME 环境变量
    restart: unless-stopped
    ports:
      - 8807:8080
    environment:
      APP_NAME: dpanel # 请保持此名称与 container_name 一致
      INSTALL_USERNAME: admin
      INSTALL_PASSWORD: admin
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /dpanel:/dpanel
  dpanel-plugin-explorer:  # 该镜像为 dpanel 的文件浏览器,隔离特权
    image: alpine:latest	
    container_name: dpanel-plugin-explorer
    restart: unless-stopped
    privileged: true
    pid: host
    command: ["sh", "-c", "tail -f /dev/null"]
```

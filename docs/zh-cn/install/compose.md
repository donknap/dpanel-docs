# 通过 compose 方式创建

> 国内镜像地址： ccr.ccs.tencentyun.com/dpanel/dpanel:latest

```
services:
  web:
    image: dpanel/dpanel:latest
    container_name: dpanel
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
  web:
    image: dpanel/dpanel:lite
    container_name: dpanel
    restart: always
    ports:
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

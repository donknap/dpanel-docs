# 通过 compose 方式创建

> 国内镜像地址： ccr.ccs.tencentyun.com/dpanel/dpanel:latest

> 如果提示网络已经存在，请先删除 docker network rm dpanel-local

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
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - dpanel:/dpanel
```
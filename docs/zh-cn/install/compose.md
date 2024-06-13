# 通过 compose 方式创建

> 国内镜像地址： ccr.ccs.tencentyun.com/donknap/dpanel:latest

```
services:
  web:
    image: donknap/dpanel:latest
    container_name: dpanel
    restart: always
    ports:
      - 80:80
      - 443:443
      - 8807:8080
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    networks:
      - dpanel
networks:
  dpanel:
    name: dpanel-local
```
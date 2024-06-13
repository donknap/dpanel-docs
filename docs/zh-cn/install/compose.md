# 通过 compose 方式创建

```
services:
  web:
    build: donknap/dpanel:latest
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
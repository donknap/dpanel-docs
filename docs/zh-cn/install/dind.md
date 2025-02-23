# Docker In Docker

DinD 的方式允许在容器中直接运行一个 Docker Daemon。\
这种方式下，容器中的 Docker Daemon 完全独立于外部，具有良好的隔离特性。

### 标准版

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
      DOCKER_HOST: tcp://docker:2375
    volumes:
      - /home/dpanel:/dpanel # 将 /home/dpanel 更改为你想要挂载的宿主机目录
    depends_on:
      - docker
  docker:
    image: docker:dind
    environment:
      DOCKER_TLS_CERTDIR: ""
    privileged: true 
```

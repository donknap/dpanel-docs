# Docker In Docker

DinD 的方式允许在容器中直接运行一个 Docker Daemon。

这种方式下，容器中的 Docker Daemon 完全独立于外部，具有良好的隔离特性。

### compose.yaml

```
services:
  dpanel:
    image: dpanel/dpanel:latest
    container_name: dpanel
    restart: always
    ports:
      - 80:80
      - 443:443
      - 8807:8080
    environment:
      DOCKER_HOST: tcp://docker:2375
      APP_NAME: dpanel # 请保持此名称与 container_name 一致
      INSTALL_USERNAME: admin
      INSTALL_PASSWORD: admin
    depends_on:
      - docker
  docker:
    image: docker:dind
    environment:
      DOCKER_TLS_CERTDIR: ""
    privileged: true 
```
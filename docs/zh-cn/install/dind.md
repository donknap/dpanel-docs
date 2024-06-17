# Docker In Docker

DinD 的方式允许在容器中直接运行一个 Docker Daemon。

这种方式下，容器中的 Docker Daemon 完全独立于外部，具有良好的隔离特性。

### compose.yaml

```
services:
  dpanel:
    image: dpanel/dpanel:latest
    restart: always
    ports:
      - :8080
    environment:
      DOCKER_HOST: tcp://docker:2375
    networks:
      - dpanel
    depends_on:
      - docker
  docker:
    image: docker:dind
    environment:
      DOCKER_TLS_CERTDIR: ""
    privileged: true 
    networks:
      - dpanel
networks:
  dpanel:
    name: dpanel-local
```